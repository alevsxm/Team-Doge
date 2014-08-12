$(document).ready(readyFunc);
$(document).on('page:load', readyFunc);

function readyFunc(){
  console.log("Ziggeo loaded bro");

  // Ziggeo Player:
  $('.show-ziglet').on('click', function(){
    var zigletDiv = $(this).parent();
    var buttonID = (this.id);
    var videoKey = buttonID.replace(/ /g,'');
    var showVideoButton = $(this);
    $('div.player').remove();
    $('button.show-ziglet').show();
    showVideoButton.hide();
    var showPlayer= '<div class="player"><ziggeo ziggeo-video=\'_' + videoKey + '\' ziggeo-width=550 ziggeo-height=450></ziggeo><button id="close-player">Close Player</button></div>';
    $(showPlayer).appendTo(zigletDiv);
    $('#close-player').on('click', function() {
      var playerDiv = $(this).parent();
      console.log(playerDiv);
      playerDiv.remove();
      showVideoButton.show();
    });
  });

  // Ziggeo Recorder:
  $('.record-ziglet').on('click', function(){
    var zigletDiv = $(this).parent();
    var buttonID = (this.id);
    var videoKey = buttonID.replace(/ /g,'');
    var oldVideokey = '_' + videoKey; 
    var recordVideoButton = $(this);
     $('div.recorder').remove();
     $('button.record-ziglet').show();
    recordVideoButton.hide();
    ZiggeoApi.Videos.destroy(oldVideokey, {
      success: function(args, results){
        // if video deleted this code runs
      },
      failure: function(args, error){
        // if error on video deletion this code runs
      }
    }); 
    var newRecorder = '<div class="recorder"><ziggeo id="ziglet-recorder" ziggeo-width=420 ziggeo-height=340 ziggeo-key=\'' + videoKey + '\' ziggeo-limit=120></ziggeo><button id="close-recorder">Close Recorder</button></div>';
    $(newRecorder).appendTo(zigletDiv);
    $('#close-recorder').on('click', function() {
      var recorderDiv = $(this).parent();
      console.log(recorderDiv);
      recorderDiv.remove();
      recordVideoButton.show();
    });
  });
}