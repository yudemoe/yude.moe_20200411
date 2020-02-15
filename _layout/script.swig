<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.bundle.min.js"
    integrity="sha256-OUFW7hFO0/r5aEGTQOz9F/aXQOt+TwqI1Z4fbVvww04=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.4/clipboard.min.js"
    integrity="sha256-FiZwavyI2V6+EXO1U+xzLG3IKldpiTFf3153ea9zikQ=" crossorigin="anonymous"></script>

{% if title == "🍳 ホーム" %}
<!-- particles.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"
    integrity="sha256-+u54FaX9J+k40eAcg5K2YzICSQjrEYBI9gju5nE3HfY=" crossorigin="anonymous"></script>
<script>
    particlesJS.load('particles-js', '../assets/particlesjs-config.json', function () {
        console.log('callback - particles.js config loaded');
    });
</script>
{% endif %}
<!-- i18n -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/i18next/19.1.0/i18next.min.js"
    integrity="sha256-42pTqClxbTQsNYA3/v6RFFKAzA2zwfjq47JQNHvoNR4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-i18next/1.2.1/jquery-i18next.min.js"
    integrity="sha256-Vo1wrHjny4hQDPA9SwBUpG/EBawhvUusdqRHb3Ia7x8=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/i18next-xhr-backend/3.2.2/i18nextXHRBackend.min.js"
    integrity="sha256-dxNIQVw/2RvuqZbPG4/pe6P0YpTY5mg7/ppSKWLjN8Y=" crossorigin="anonymous"></script>
    {% if title == "👤 プロフィール" %}
    <!-- discord status -->
    <script await>
    var req = new XMLHttpRequest();
    req.open('GET', 'https://yude.glitch.me', true);
    req.onload = function () {
      var status = this.response;
      if (status == "online") {
        var color = '#43b581'
      }
      if (status == "idle") {
        var color = '#faa61a'
      }
      if (status == "dnd") {
        var color = '#f04747'
      }
      if (status == "offline") {
        var color = '#747f8d'
      }
      var str = document.getElementById("discord").innerHTML;
      str = str.replace(
        '<span style="color: white" class="spinner-border" role="status">',
        '<span style="font-size: 1.4em"><i style="color: ' + color + '" class="fab fa-discord"></i></span>');
        str = str.replace(
        '<span class="sr-only">Loading...</span></span>',
        '');
      document.getElementById("discord").innerHTML = str;
      console.log("Got Discord status: "+status+" and color is "+color+" .")
    }
    req.send();
  </script>
    {% endif %}
{% raw %}
<script>
    var urlParam = location.search.substring(1);
    if (urlParam) {
        var param = urlParam.split('&');
        var paramArray = [];
        for (i = 0; i < param.length; i++) {
            var paramItem = param[i].split('=');
            paramArray[paramItem[0]] = paramItem[1];
        }
        var lang = paramArray.lang
    } else {
        var lang = navigator.languages ? navigator.languages[0] : (navigator.language || navigator.userLanguage);
        var lang = lang.split("-")[0];
    }
    i18next.use(i18nextXHRBackend).init({
        lng: lang,
        debug: false,
        fallbackLng: false,
        defaultLng: 'en',
        backend: {
            loadPath: '../locales/{{lng}}/translation.json'
        }
    }, function (err, t) {
        jqueryI18next.init(i18next, $);
        $("[data-i18n]").localize();
    });
    console.log("Detected language is " + lang + ".");
</script>
{% endraw %}
<script async>
    $(document).on('show.bs.tooltip', function (e) {
        setTimeout(function () {
            $('[data-toggle="tooltip"]').tooltip('hide');
        }, 400);
    });
</script>
<script async>
    new ClipboardJS('.btn');
</script>