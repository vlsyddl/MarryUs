$(document).ready(function(){
    $(".gnbBar").ready(function(){
        var bar = $(".gnbBar");
        bar.css({
            "width":$(".gnb_bot > ul > li").css("width")
        })
        $(".gnb_bot > ul > li").each(function(){
            if($(this).hasClass("on")){
                bar.animate({
                    "left":$(this).offset().left,
                    "opacity":"1"
                },300)
            }
        })
        $(".gnb_bot > ul > li").mouseenter(function(){
            var tg = $(this);
            bar.animate({
                "left":tg.offset().left,
                "opacity":"1"
            },300)
        })
        $(".gnb_bot > ul").mouseleave(function(){
            $(".gnb_bot > ul > li").each(function(){
                if($(this).hasClass("on")){
                    bar.animate({
                        "left":$(this).offset().left,
                        "opacity":"1"
                    },300)
                    return
                }      
            })
            bar.animate({"opacity":"0"},300)
        })
    })

    $(window).ready(function(){
        var len = $(".contentsTab >ul > li").length
        $(".contentsTab >ul > li").css({"width":(100/len)+"%"})
    });

    $(".contentsTab > ul >li").click(function(){
        var target = $(this).data("target")
        $(".contentsTab > ul >li").removeClass("on")
        $(this).addClass("on")
        $(".tabContents > div").removeClass("on")
        $("."+target).addClass("on")
    })

    
})
$(document).ready(function(){
    var loginForm = $('.Login-card--login');
var registerForm = $('.Login-card--register');
var connectForm = $('.Login-card--connect');

var navItems = $('.Login-navigation__link');
navItems.click(function () {
  $this = $(this);
  goto($this.data('goto'));
});

function init() {
  animateOrder();
  
  $('.Util-not-loaded').removeClass('Util-not-loaded');
}

function goto(sectionClass) {
  // Get the current active section.
  var loginOrder    = parseInt(loginForm.data('order'));
  var registerOrder = parseInt(registerForm.data('order'));
  var connectOrder  = parseInt(connectForm.data('order'));
  
  var active, next;
  switch(1) {
    case loginOrder:
      active = loginForm;
      break;
    case registerOrder:
      active = registerForm;
      break;
    case connectOrder:
      active = connectForm;
      break;
  }
  
  next = $('.' + sectionClass);
  
  // Swap the current and next section.
  active.addClass('Login-card--hidden');
  next.removeClass('Login-card--hidden');
  
  var nextOrder = next.data('order');
  active.data('order', nextOrder);
  next.data('order', 1);
  
  // Execute the animation.
  animateOrder();
  
}

function next() {
  
  // Get the current active section.
  var loginOrder    = parseInt(loginForm.data('order'));
  var registerOrder = parseInt(registerForm.data('order'));
  var connectOrder  = parseInt(connectForm.data('order'));
  
  var active, next;
  switch(1) {
    case loginOrder:
      active = loginForm;
      next = registerForm;
      break;
    case registerOrder:
      active = registerForm;
      next = connectForm;
      break;
    case connectOrder:
      active = connectForm;
      next = loginForm;
      break;
  }
  
  // Swap the current and next section.
  active.addClass('Login-card--hidden');
  next.removeClass('Login-card--hidden');
  
  var nextOrder = next.data('order');
  active.data('order', nextOrder);
  next.data('order', 1);
  
  // Execute the animation.
  animateOrder();
}

function animateOrder() {
  
  var loginOrder    = parseInt(loginForm.data('order'));
  var registerOrder = parseInt(registerForm.data('order'));
  var connectOrder  = parseInt(connectForm.data('order'));
  
  var loginOffset     = 18 - loginOrder*2;
  var registerOffset  = 18 - registerOrder*2;
  var connectOffset   = 18 - connectOrder*2;
  
  loginForm.css('margin-left', (-loginOffset) + 'em');
  registerForm.css('margin-left', (-registerOffset) + 'em');
  connectForm.css('margin-left', (-connectOffset) + 'em');
  
  loginForm.css('margin-right', (loginOffset-32) + 'em');
  registerForm.css('margin-right', (registerOffset-32) + 'em');
  connectForm.css('margin-right', (connectOffset-32) + 'em');
  
  loginForm.css('margin-top', loginOrder + 'em');
  registerForm.css('margin-top', registerOrder + 'em');
  connectForm.css('margin-top', connectOrder + 'em');
  
  loginForm.css('padding-bottom', (3-loginOrder) + 'em');
  registerForm.css('padding-bottom', (3-registerOrder) + 'em');
  connectForm.css('padding-bottom', (3-connectOrder) + 'em');
  
}

init();

//setInterval(next, 2000);

//플래닝
var counter = 1;
$(document).ready(function() {

  var erroEle = $('.error-message'),
    focusInput = $('.questions').find('.active');

  $('.navigation a').click(function() {
    nextMaster('navi');

    var thisInput = $('#' + $(this).attr('data-ref'));
    $('.active').removeClass('active');
    thisInput.focus().addClass('active')
    thisInput.closest('li').animate({
      marginTop: '0px',
      opacity: 1
    }, 200);
    thisInput.closest('li').prevAll('li').animate({
        marginTop: '-150px',
        opacity: 0
      }, 200)
      //                     .AddClass('done');

    thisInput.closest('li').nextAll('li').animate({
        marginTop: '150px',
        opacity: 0
      }, 200)
      //                    .RemoveClass('done');
    errorMessage(erroEle, '', 'hidden', 0);

  });

  if (focusInput.val() != '') {
    $('#next-page').css('opacity', 1);
  }

  $(document).keypress(function(event) {
    if (event.which == 13) {
      nextMaster('keypress');
      event.preventDefault();
    }

    $('#next-page').click(function() {
      var focusInput = $('.questions').find('.active');
      nextMaster('nextpage');

    })

  });

  function nextMaster(type) {
    var focusInput = $('.questions').find('.active');
    if (focusInput.val() != '') {
      if ((focusInput.attr('name') == 'name' || focusInput.attr('name') == 'username') && focusInput.val().length < 2) {
        errorMessage(erroEle, "isn't your " + focusInput.attr('name') + " bit small. ", 'visible', 1);
      } else if (focusInput.attr('name') == 'email' && !validateEmail(focusInput.val())) {
        errorMessage(erroEle, "It doesn't look like a " + focusInput.attr('name'), 'visible', 1);
      } else if (focusInput.attr('name') == 'phone' && !validatePhone(focusInput.val())) {
        errorMessage(erroEle, "It doesn't look like a " + focusInput.attr('name'), 'visible', 1);
      } else {

        if (type != 'navi') showLi(focusInput);
        $('#next-page').css('opacity', 0);
        errorMessage(erroEle, '', 'hidden', 0);
      }
    } else if (type == 'keypress') {
      errorMessage(erroEle, 'please enter your ' + focusInput.attr('name'), 'visible', 1);
    }

  }

  $("input[type='text']").keyup(function(event) {
    var focusInput = $(this);
    if (focusInput.val().length > 1) {
      if ((focusInput.attr('name') == 'email' && !validateEmail(focusInput.val())) ||
        (focusInput.attr('name') == 'phone' && !validatePhone(focusInput.val()))) {
        $('#next-page').css('opacity', 0);
      } else {
        $('#next-page').css('opacity', 1);
      }

    } else {
      $('#next-page').css('opacity', 0);
    }
  });

  $("#password").keyup(function(event) {
    var focusInput = $(this);
    $("#viewpswd").val(focusInput.val());
    if (focusInput.val().length > 1) {
      $('#next-page').css('opacity', 1);
    }
  });

  $('#signup').click(function() {
    $('.navigation').fadeOut(400).css({
      'display': 'none'
    });
    $('#sign-form').fadeOut(400).css({
      'display': 'none'
    });
    $(this).fadeOut(400).css({
      'display': 'none'
    });
    $('#wf').animate({
      opacity: 1,
      marginTop: '1em'
    }, 500).css({
      'display': 'block'
    });
  });

  $('#show-pwd').mousedown(function() {
    $(this).toggleClass('view').toggleClass('hide');
    $('#password').css('opacity', 0);
    $('#viewpswd').css('opacity', 1);
  }).mouseup(function() {
    $(this).toggleClass('view').toggleClass('hide');
    $('#password').css('opacity', 1);
    $('#viewpswd').css('opacity', 0);
  });

});

function showLi(focusInput) {

  focusInput.closest('li').animate({
    marginTop: '-150px',
    opacity: 0
  }, 200);

  console.log(focusInput.closest('li'));

  if (focusInput.attr('id') == 'viewpswd') {
    $("[data-ref='" + focusInput.attr('id') + "']")
      .addClass('done').html('password');
    //                    .html(Array(focusInput.val().length+1).join("*"));
  } else {
    $("[data-ref='" + focusInput.attr('id') + "']").addClass('done').html(focusInput.val());
  }

  focusInput.removeClass('active');
  counter++;

  var nextli = focusInput.closest('li').next('li');

  nextli.animate({
    marginTop: '0px',
    opacity: 1
  }, 200);

  nextli.find('input').focus().addClass('active');

}

function errorMessage(textmeg, appendString, visib, opaci) {
  textmeg.css({
    visibility: visib
  }).animate({
    opacity: opaci
  }).html(appendString)
}

function validateEmail(email) {
  var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
}

function validatePhone(phone) {
  var re = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/;
  return re.test(phone);
}
})

$(document).ready(function(){
    // Source: stackoverflow
    (function($) {
      $.fn.CountDownTimer = function(dt) {
              var end = new Date(dt);

              var _second = 1000;
              var _minute = _second * 60;
              var _hour = _minute * 60;
              var _day = _hour * 24;
              var timer;

              function showRemaining() {
                var now = new Date();
                var distance = end - now;
                if (distance < 0) {

                clearInterval(timer);
                document.getElementById(id).innerHTML = 'EXPIRED!';

                return;
                }
                var days = Math.floor(distance / _day);
                var hours = Math.floor((distance % _day) / _hour);
                var minutes = Math.floor((distance % _hour) / _minute);
                var seconds = Math.floor((distance % _minute) / _second);
                
                $(".time .day dd").html(days);
                $(".time .hours dd").html(hours);
                $(".time .min dd").html(minutes);
                $(".time .sec dd").html(seconds);
            }

          timer = setInterval(showRemaining, 1000);
      };
  })(jQuery);
})