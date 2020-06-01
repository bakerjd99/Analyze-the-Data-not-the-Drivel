import os
import sys
import json
from nb2wp import nb2wp

# append test script directories to system path
sys.path.append(r'C:\temp\nb2wp')

# use a subdirectory visible to jupyter
NB_DIRECTORY = r'C:/Users/john.baker/bixml/nb2wp/'

nb2subnb_defaults = {
    'single_nb': False,
    'cell_type': 'code',
    'keep_cells': [],
    'keep_texts': []
}

nb2wp_defaults = {
    'out_dir': r'C:\temp\nb2wp\tmp',
    'css_files': [r'C:\temp\nb2wp\style.css'],
    'save_css': True,
    'remove_attrs': False,
    'img_dir': 'C:\temp\nb2wp\tmp\img',
    'footer': False,
    'quiet': False
}


def text_in_source(cell, keep_texts):
    r"True if any of the (keep_texts) strings occur in source cell text"
    if 0 == len(keep_texts):
        return True

    # all source lines as single string
    src_code = ""
    for src_line in cell['source']:
        src_code += src_line

    # do any of the keep strings occur in source?
    return True in [keep_texts[i] in src_code for i in range(len(keep_texts))]


def insert_nb_metadata(nb_data, nb_cells):
    r"copy notebook metadata to sub-notebooks"
    nb_cells["metadata"] = nb_data["metadata"]
    nb_cells["nbformat"] = nb_data["nbformat"]
    nb_cells["nbformat_minor"] = nb_data["nbformat_minor"]
    return nb_cells


def nb2subnb(filename, *, cell_type='markdown', single_nb=False, keep_cells=[], keep_texts=[]):
    r"""
    (nb2subnb) splits out typed cells of jupyter notebooks into n sub-notebooks.

    examples:

       # split into n markdown cell notebooks
       nb2subnb(r'C:\temp\nb2wp\UsingJodliterate.ipynb')

       # split into n code cell notebooks
       nb2subnb(r'C:\temp\nb2wp\UsingJodliterate.ipynb', cell_type='code')

       # all markdown cells in single notebook
       nb2subnb(r'C:\temp\nb2wp\UsingJodliterate.ipynb', single_nb='True')

       # code cells with cell numbers in range as single notebook
       nb2subnb(r'C:\temp\nb2wp\UsingJodliterate.ipynb', cell_type='code', 
                single_nb='True', keep_cells=list(range(10)))

       # all markdown cells with strings 'Bhagavad' or 'github' 
       nb2subnb(r'C:\temp\nb2wp\UsingJodliterate.ipynb', single_nb='True',
                keep_texts=['Bhagavad','github'])

       # all code cells in range with string 'pacman' 
       nb2subnb(r'C:\temp\nb2wp\UsingJodliterate.ipynb', cell_type='code',
                keep_texts=['pacman'], keep_cells=list(range(30)))

    """
    with open(filename) as in_file:
        nb_data = json.load(in_file)

    # notebook file name without extension/path
    nbname = os.path.basename(os.path.splitext(filename)[0])

    nb_cells, one_cell, nb_files = dict(), list(), list()

    for cnt, cell in enumerate(nb_data['cells']):
        if nb_data['cells'][cnt]['cell_type'] == cell_type:

            if not single_nb:
                # single cell notebooks
                nb_cells, one_cell = dict(), list()
                if 0 == len(keep_cells) or cnt in keep_cells:
                    if text_in_source(cell, keep_texts):
                        one_cell.append(cell)
                        nb_cells["cells"] = one_cell
                        nb_cells = insert_nb_metadata(nb_data, nb_cells)
                        nb_out_file = NB_DIRECTORY + nbname + '-' + \
                            cell_type + '-' + str(cnt) + '.ipynb'
                        nb_files.append(nb_out_file)
                        with open(nb_out_file, 'w') as out_file:
                            json.dump(nb_cells, out_file, ensure_ascii=False)
            elif single_nb:
                # single notebook with only (cell_type) cells
                if 0 == len(keep_cells) or cnt in keep_cells:
                    if text_in_source(cell, keep_texts):
                        one_cell.append(cell)
                        nb_cells["cells"] = one_cell

    if single_nb:
        nb_out_file = NB_DIRECTORY + nbname + '-' + cell_type + '-only.ipynb'
        nb_files.append(nb_out_file)
        nb_cells = insert_nb_metadata(nb_data, nb_cells)
        with open(nb_out_file, 'w') as out_file:
            json.dump(nb_cells, out_file, ensure_ascii=False)

    # list of generated sub-notebooks
    return nb_files


def nb2wpblk(filename, *, nb2subnb_parms=None, nb2wp_parms=None):
    r"""
    (nb2wpblk) splits notebooks into sub-notebooks and converts
    the sub-notebooks to HTML with (nb2wp). See (nb2wp) and (nb2subnb)
    """

    # use defaults if no options
    if nb2subnb_parms is None:
        nb2subnb_parms = nb2subnb_defaults
    if nb2wp_parms is None:
        nb2wp_parms = nb2wp_defaults

    # split notebook and convert parts
    nb_cell_files = nb2subnb(filename, **nb2subnb_parms)
    for nb in nb_cell_files:
        nb2wp(nb, **nb2wp_parms)
