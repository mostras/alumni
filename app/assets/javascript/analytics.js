window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());

function trackGoogleAnalytics(event) {
  gtag('config', 'G-2ZN3TTKPZT', {
    'cookie_flags': 'max-age=7200;secure;samesite=none'
  })
}

document.addEventListener('turbolinks:load', trackGoogleAnalytics)

  // gtag('config', 'G-2ZN3TTKPZT');
