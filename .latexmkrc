$pdf_mode = 1;
$pdf_previewer = "open -a 'PDF Expert'";
$pdflatex = "xelatex -file-line-error --shell-escape -src-specials -synctex=1 -interaction=nonstopmode %O %S";
$preview_continuous_mode = 1;
$pdf_update_method = 0;
$clean_ext = "synctex.gz acn acr alg aux bbl bcf blg brf fdb_latexmk glg glo gls idx ilg ind ist lof log lot out run.xml toc dvi xdv hd loe ptc run.xml thm";
# $out_dir = "build";
# 如果使用 biber 处理参考文献
$bibtex = 'bibtex %O %S';
