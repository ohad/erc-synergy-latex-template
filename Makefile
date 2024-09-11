.PHONY: part-B1/erc-B1.pdf part-B2/erc-B2.pdf

submission/erc-syg.pdf: part-B1/erc-B1.pdf part-B2/erc-B2.pdf
	mkdir -p submission
	sh bin/pdfmerge submission/erc-syg.pdf part-B1/erc-B1.pdf part-B2/erc-B2.pdf
submission:
	mkdir submission

part-B1/erc-B1.pdf:
	make -C part-B1

part-B2/erc-B2.pdf:
	make -C part-B2

clean:
	make -C part-B1 clean
	make -C part-B2 clean
