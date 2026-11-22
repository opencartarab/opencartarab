/* الجمعة البيضاء 2026
   - يفعل تلقائيا بين START و END (توقيت الرياض) ثم يختفي من نفسه.
   - للمعاينة: أضف ?wf=on أو ?wf=off لرابط أي صفحة.
   - لا يغير أي سعر في الموقع: العروض كلها في الصفحة white-friday-offers.html */
(function () {
    'use strict';

    var START = Date.parse('2026-11-22T00:00:00+03:00');
    var END = Date.parse('2026-11-30T23:59:59+03:00');
    var OFFERS_PAGE = 'white-friday-offers.html';

    var qs = window.location.search;
    var forcedOn = /[?&]wf=(on|1)(&|$)/.test(qs), forcedOff = /[?&]wf=(off|0)(&|$)/.test(qs);
    var now = Date.now();
    var active = !forcedOff && (forcedOn || (now >= START && now <= END));

    function ready(fn) {
        if (document.readyState === 'loading') { document.addEventListener('DOMContentLoaded', fn); } else { fn(); }
    }

    // خارج فترة العرض: صفحة العروض تعرض رسالة بدل العروض
    if (!active) {
        ready(function () {
            var ended = document.querySelector('[data-wf-ended]');
            if (!ended) { return; }
            [].forEach.call(document.querySelectorAll('[data-wf-live]'), function (el) { el.hidden = true; });
            ended.querySelector('[data-wf-ended-text]').textContent = now < START
                ? 'العروض ما بدأت للحين، نشوفك يوم 22 نوفمبر'
                : 'انتهت عروض الجمعة البيضاء، ترقب عروضنا الجاية';
            ended.hidden = false;
        });
        return;
    }

    document.documentElement.classList.add('wf');

    function pad(n) { return n < 10 ? '0' + n : String(n); }
    function left() {
        var d = Math.max(0, END - Date.now());
        return 'ينتهي بعد ' + Math.floor(d / 86400000) + ' يوم ' + pad(Math.floor(d % 86400000 / 3600000)) + ':' +
            pad(Math.floor(d % 3600000 / 60000)) + ':' + pad(Math.floor(d % 60000 / 1000));
    }

    function addBar() {
        try { if (sessionStorage.getItem('wf-bar-closed') === '1') { return; } } catch (e) {}
        var onOffers = /white-friday-offers/.test(location.pathname);
        var bar = document.createElement('div');
        bar.className = 'wf-bar';
        bar.innerHTML = '<div class="wf-bar__inner"><span class="wf-bar__tag">الجمعة البيضاء</span>' +
            '<span>عروض على فتح المتاجر وخدمات الدعم الفني</span>' +
            '<span class="wf-bar__count" data-wf-count></span>' +
            (onOffers ? '' : '<a href="' + OFFERS_PAGE + '">شاهد العروض</a>') +
            '<button type="button" class="wf-bar__close" aria-label="إغلاق">&times;</button></div>';
        bar.querySelector('.wf-bar__close').onclick = function () {
            bar.remove();
            try { sessionStorage.setItem('wf-bar-closed', '1'); } catch (e) {}
        };
        document.body.insertBefore(bar, document.body.firstChild);
    }

    function addBadge() {
        var host = document.querySelector('.hero .col-lg-6.text-center');
        if (!host) { return; }
        var a = document.createElement('a');
        a.className = 'wf-badge';
        a.href = OFFERS_PAGE;
        a.innerHTML = '<span class="wf-badge__top">الجمعة البيضاء</span>' +
            '<span class="wf-badge__big">عروض خاصة</span>' +
            '<span class="wf-badge__sub">لمتجرك الجديد أو الشغال</span>' +
            '<span class="wf-badge__ends">حتى 30 نوفمبر</span>';
        host.appendChild(a);
    }

    function tick() {
        var el = document.querySelector('[data-wf-count]');
        if (el) { el.textContent = left(); }
    }

    ready(function () { addBar(); addBadge(); tick(); setInterval(tick, 1000); });
})();
