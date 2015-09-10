rem make bm.epub
pandoc -S --epub-metadata=bmmetadata.xml --epub-cover-image=bmcover.jpg --epub-embed-font=apl385.ttf -o bm.epub bm.markdown