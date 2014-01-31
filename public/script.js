var updateStatus = function(status) {
  document.getElementById('status').innerHTML = status;
}

window.addEventListener('load', function(e) {

  var logEvent = function(status){
    window.applicationCache.addEventListener(status, function(e) {
      updateStatus(status);
    }, false);
  }

  var events = [
    'cached',
    'checking',
    'downloading',
    'error',
    'noupdate',
    'obsolete',
    'progress',
    'updateready'
  ];

  events.forEach(logEvent);

}, false);
