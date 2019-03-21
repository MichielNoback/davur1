library(knitr)
options(width = 100)
opts_chunk$set(message = F,
               error = F,
               warning = F,
               comment = NA,
               fig.align = 'center',
               cache.path = '.cache/',
               fig.path = 'fig/',
               cache = FALSE,
               tidy = FALSE
           )
#tidy = TRUE,
#tidy.opts=list(width.cutoff=60),

opts_knit$set(
    global.par = TRUE
)

options(xtable.type = 'html')
knit_hooks$set(inline = function(x) {
    if(is.numeric(x)) {
        round(x, getOption('digits'))
    } else {
        paste(as.character(x), collapse = ', ')
    }
})
##note: this is the cause for missing figures in pdf Beamer output
knit_hooks$set(plot = knitr:::hook_plot_html)
