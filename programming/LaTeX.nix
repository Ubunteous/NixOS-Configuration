{ config, pkgs, user, ... }:

{
  users.users.${user} = {
    #############
    #   LaTeX   #
    #############

    packages = with pkgs; [
      # ghostscript # for latex images/equations with preview-region
      
      (texlive.combine {
        inherit (texlive)
          scheme-basic # base (but not minimal)
          comment
          
          # fullpage missing => maybe in bigger scheme like
          # [T1]fontenc => old font. don't use it. lmodern is better

          # oad
          pdfpages
          ulem
          fp
          changepage
          xcolor
          pdflscape

          # cv
          fontawesome
          # hyperref

          # org
          dvipng # essential
          # wrapfig
          # capt-of
          # kpathsea
          # metafont
          parskip

          
          # misc
          beamer
	        extsizes
	        caption
          pgfgantt
          multirow
          biblatex
          biber
        ;})
    ];
  };
}
