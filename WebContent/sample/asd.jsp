<html>
<head>
  <meta charset="utf-8">
  <title>getUserMedia Video Example</title>
</head>
<body>
  <button type="button" onclick="toggle()">
    Toggle Video
  </button>
  <br/>
  <video id="video" width="800" height="600"></video>
  <script type="application/javascript;version=1.7">
    let streaming = false;
    let video = document.getElementById("video");
    function toggle() {
      if (!streaming) {
        startVideo();
        return;
      }
      video.pause();
      video.src = null;
      streaming = false;
    }
    function startVideo() {
      navigator.mozGetUserMedia(
        {video: true},
        function(stream) {
          video.src = stream;
          video.play();
          streaming = true;
        },
        function(err) {
          alert("An error occured! " + err);
        }
      );
    }
  </script>
</body>
</html>