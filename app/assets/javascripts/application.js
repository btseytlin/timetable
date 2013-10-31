// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$().ready(function(){
    checkForms()
    setInterval(checkForms, 5000);
    ReplaceCode();

    $('.btn-done').click(function () {
        BtnDone($(this));
    });

    $('.btn-confirm').click(function () {
        BtnConfirm($(this));
    });

    $('.btn-warning').click(function () {
        BtnConfirm($(this));
    });

});

function BtnWarning(elem) {
    var $this = elem;
    if ($this.data('animation') == 'true') {
        return false
    }
    var $default = $this.find('.button-default');
    var $prompt = $this.find('.button-prompt');
    var $overflow = $this.find('.button-overflow');

    if ($this.data('button') == 'closed') {
        $default.fadeOut(10);
        $this.data('animation', 'true')
        $prompt.animate({
            top: '0'
        }, 500, 'linear', function () {
            $this.data('animation', 'false')
        });

        $this.data('button', 'prompting');
    } else if ($this.data('button') == 'prompting') {
        $prompt.animate({
            top: '-100px'
        }, 100, function () {
            $this.data('animation', 'false')
        })
        $prompt.toggle()
        $this.data('animation', 'true')
        $overflow.animate({
            top: '0'
        }, 500, 'linear', function () {
            $this.data('animation', 'false')
        })
        dellay
        $this.data('button', 'open');

        setTimeout(function () {
            $this.data('animation', 'true')
            $overflow.animate({
                top: '-100px'
            }, 500, function () {
                $this.data('animation', 'false')
                $default.fadeIn(100);
                $prompt.toggle()
                $this.data('button', 'closed');
            })
        }, 2000)
    }
}

function BtnConfirm(elem) {
    var $this = elem;
    if ($this.data('animation') == 'true') {
        return false
    }
    var $default = $this.find('.button-default');
    var $prompt = $this.find('.button-prompt');
    var $overflow = $this.find('.button-overflow');

    if ($this.data('button') == 'closed') {
        $default.fadeOut(10);
        $this.data('animation', 'true')
        $prompt.animate({
            top: '0'
        }, 500, 'linear', function () {
            $this.data('animation', 'false')
        });

        $this.data('button', 'prompting');
    } else if ($this.data('button') == 'prompting') {
        $prompt.animate({
            top: '-100px'
        }, 100, function () {
            $this.data('animation', 'false')
        })
        $prompt.toggle()
        $this.data('animation', 'true')
        $overflow.animate({
            top: '0'
        }, 500, 'linear', function () {
            $this.data('animation', 'false')
        })

        $this.data('button', 'open');

        setTimeout(function () {
            $this.data('animation', 'true')
            $overflow.animate({
                top: '-100px'
            }, 500, function () {
                $this.data('animation', 'false')
                $default.fadeIn(100);
                $prompt.toggle()
                $this.data('button', 'closed');
            })
        }, 2000)
    }
}

function BtnDone(elem) {
    var $this = elem;
    if ($this.data('animation') == 'true') {
        return false
    }
    var $default = $this.find('.button-default');
    var $overflow = $this.find('.button-overflow');

    if ($this.data('button') == 'closed') {
        $default.fadeOut(10);
        $this.data('animation', 'true')
        $overflow.animate({
            top: '0'
        }, 500, 'linear', function () {
            $this.data('animation', 'false')
        });

        $this.data('button', 'open');

        setTimeout(function () {
            $this.data('animation', 'true')
            $overflow.animate({
                top: '-100px'
            }, 500, function () {
                $this.data('animation', 'false')
                $default.fadeIn(100);
            })

            $this.data('button', 'closed');
        }, 2000)
    }

}

function ReplaceCode() {
    var $word, $link, $linkword;
    $('.btn-war').each(function () {

        $link = $(this).find('a').attr("href");

        $linkword = $(this).find('a').text();
        $(this).find('a').html('');
        $word = $(this).text();

        $(this).empty()
            .attr("class", "btn-warning")
            .data('button', 'closed')
            .append('<div class="button-default"> <span class="button-text">' + $word + '</span></div>')
            .append('<div class="button-prompt"><div class="button-prompt-text"><a href="' + $link + '">' + $linkword + '</a></div></div>')
            .append('<div class="button-overflow"><div class="button-overflow-text">Done</div> </div>');
    });

    $('.btn-con').each(function () {
        
        $word = $(this).find('a').html();
        $(this).find('a').text('Confirm?');
        $link = $(this).html()
        
        
        

        $(this).empty()
            .attr("class", "btn-confirm")
            .data('button', 'closed')
            .append('<div class="button-default"> <span class="button-text">' + $word + '</span></div>')
            .append('<div class="button-prompt"><div class="button-prompt-text">' + $link +'</div></div>')
            .append('<div class="button-overflow"><div class="button-overflow-text">Done</div> </div>');

    });



    $('.btn').each(function () {
        $link = $(this).find('a').attr("href");

        $linkword = $(this).find('a').text();

        $(this).empty()
            .attr("class", "btn-done")
            .data('button', 'closed')
            .append('<div class="button-default"><a class="button-text" href="' + $link + '">' + $linkword + '</a></span></div>')
            .append('<div class="button-overflow"><div class="button-overflow-text">Done</div> </div>');
    });
}

function checkForms() {
    $('.form-input').each(function(){
     
        switch($(this).data('format')){ 
           
            case 'email':
                var email = /(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))/;
                
                if ($(this).val()){
                    if(email.test($(this).val())){
                        $(this).parent().removeClass('failure');
                        $(this).parent().addClass('success');
                    }
                    else {
                        $(this).parent().removeClass('success');
                        $(this).parent().addClass('failure');
                    }
                } 
                else {
                     $(this).parent().removeClass('success');
                     $(this).parent().removeClass('failure');
                }
                break;
             
             default:
                if ($(this).val()){
                    $(this).parent().addClass('success');
                }
                else {
                    $(this).parent().removeClass('success');
                } 
                
        }
    })   ;
  
}

