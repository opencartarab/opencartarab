/* ==========================================================================
   اليوم الوطني السعودي 96 — عزّنا بطبعنا
   يُحمَّل داخل <head> مباشرة بعد style.css حتى لا يظهر أي وميض في التصميم.

   ما يفعله:
   1) يضيف الصنف nd96 على <html> خلال فترة الحملة فقط.
   2) يبني الشريط العلوي.
   3) يشغّل العدّاد التنازلي في الصفحة الرئيسية.

   للمعاينة قبل/بعد الفترة:  أضف  ?nd96=on  أو  ?nd96=off  لرابط أي صفحة.
   ========================================================================== */
(function () {
    'use strict';

    /* ---------------- الإعدادات (عدّلها من هنا فقط) ---------------- */
    var CONFIG = {
        // اليوم الوطني السعودي 96 — 23 سبتمبر 2026 عند منتصف الليل بتوقيت الرياض
        target: '2026-09-23T00:00:00+03:00',
        // بعد هذا التاريخ يعود الموقع لتصميمه الأصلي تلقائيًا
        activeUntil: '2026-09-30T00:00:00+03:00',
        themeColor: '#006C35',
        fontsUrl: 'https://fonts.googleapis.com/css2?family=Aref+Ruqaa:wght@400;700&family=Reem+Kufi:wght@500;700&display=swap'
    };
    /* ---------------------------------------------------------------- */

    var DAY = 86400000;
    var KSA_OFFSET = 3 * 3600000; // توقيت الرياض UTC+3 بدون توقيت صيفي

    var search = window.location.search;
    var forcedOn = /[?&]nd96=(on|1)(&|$)/.test(search);
    var forcedOff = /[?&]nd96=(off|0)(&|$)/.test(search);

    var target = Date.parse(CONFIG.target);
    var activeUntil = Date.parse(CONFIG.activeUntil);

    if (forcedOff || (!forcedOn && Date.now() >= activeUntil)) { return; }

    var root = document.documentElement;
    root.classList.add('nd96');

    /* لون شريط المتصفح في الجوال + الخطوط الخاصة بالحملة */
    var head = document.head || document.getElementsByTagName('head')[0];
    var meta = document.createElement('meta');
    meta.name = 'theme-color';
    meta.content = CONFIG.themeColor;
    head.appendChild(meta);

    var fonts = document.createElement('link');
    fonts.rel = 'stylesheet';
    fonts.href = CONFIG.fontsUrl;
    head.appendChild(fonts);

    /* ---------------- أدوات ---------------- */
    function pad(n) { return n < 10 ? '0' + n : String(n); }

    function phase(now) {
        if (now < target) { return 'before'; }
        if (now < target + DAY) { return 'day'; }
        return 'after';
    }

    // عدد الأيام التقويمية (بتوقيت الرياض) حتى يوم المناسبة
    function calendarDaysLeft(now) {
        var todayStart = Math.floor((now + KSA_OFFSET) / DAY) * DAY;
        var targetStart = target + KSA_OFFSET;
        return Math.round((targetStart - todayStart) / DAY);
    }

    function daysText(n) {
        if (n === 1) { return 'يوم واحد'; }
        if (n === 2) { return 'يومان'; }
        if (n >= 3 && n <= 10) { return n + ' أيام'; }
        return n + ' يومًا';
    }

    function barCountText(now) {
        var p = phase(now);
        if (p === 'day') { return 'اليوم يوم الوطن'; }
        if (p === 'after') { return ''; }
        var days = calendarDaysLeft(now);
        return days === 1 ? 'غدًا' : 'باقي ' + daysText(days);
    }

    /* ---------------- الشريط العلوي ---------------- */
    var BAR_KEY = 'nd96-bar-closed';

    function buildBar() {
        try { if (window.sessionStorage.getItem(BAR_KEY) === '1') { return null; } } catch (e) { /* التخزين غير متاح */ }

        var bar = document.createElement('div');
        bar.className = 'nd96-bar';
        bar.setAttribute('role', 'region');
        bar.setAttribute('aria-label', 'اليوم الوطني السعودي 96');
        bar.innerHTML =
            '<div class="nd96-bar__inner">' +
                '<span class="nd96-bar__num" aria-hidden="true">96</span>' +
                '<span class="nd96-bar__title">كل عام والمملكة بخير في يومها الوطني</span>' +
                '<span class="nd96-bar__slogan">عزّنا بطبعنا</span>' +
                '<span class="nd96-bar__count" data-nd96-bar-count></span>' +
                '<button type="button" class="nd96-bar__close" aria-label="إغلاق الشريط">&times;</button>' +
            '</div>';

        bar.querySelector('.nd96-bar__close').addEventListener('click', function () {
            bar.parentNode.removeChild(bar);
            try { window.sessionStorage.setItem(BAR_KEY, '1'); } catch (e) { /* تجاهل */ }
        });
        return bar;
    }

    /* ---------------- التحديث الدوري ---------------- */
    function tick() {
        var now = Date.now();
        var p = phase(now);

        var barCount = document.querySelector('[data-nd96-bar-count]');
        if (barCount) { barCount.textContent = barCountText(now); }

        var box = document.querySelector('[data-nd96-countdown]');
        var msg = document.querySelector('[data-nd96-msg]');
        if (!box || !msg) { return; }

        if (p === 'before') {
            var diff = target - now;
            var d = Math.floor(diff / DAY);
            var h = Math.floor((diff % DAY) / 3600000);
            var m = Math.floor((diff % 3600000) / 60000);
            var s = Math.floor((diff % 60000) / 1000);
            var values = { days: d, hours: pad(h), minutes: pad(m), seconds: pad(s) };
            for (var key in values) {
                if (Object.prototype.hasOwnProperty.call(values, key)) {
                    var el = box.querySelector('[data-unit="' + key + '"]');
                    if (el) { el.textContent = values[key]; }
                }
            }
            box.hidden = false;
            msg.hidden = true;
        } else {
            box.hidden = true;
            msg.hidden = false;
            msg.textContent = p === 'day' ? 'اليوم يوم الوطن، كل عام والمملكة بخير' : 'كل عام والمملكة بخير';
        }
    }

    function init() {
        var bar = buildBar();
        if (bar) { document.body.insertBefore(bar, document.body.firstChild); }
        tick();
        window.setInterval(tick, 1000);
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
