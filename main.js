function loadComponents() {
    const components = [
        { id: 'header-placeholder', file: 'header.html' },
        { id: 'footer-placeholder', file: 'footer.html' }
    ];

    components.forEach(comp => {
        const el = document.getElementById(comp.id);
        if (el) {
            fetch(comp.file)
                .then(response => response.text())
                .then(data => {
                    el.innerHTML = data;
                    if (comp.id === 'header-placeholder') {
                        setActiveLink();
                    }
                    if (comp.id === 'footer-placeholder') {
                        initWhatsAppButton();
                    }
                });
        }
    });
}

function setActiveLink() {
    const path = window.location.pathname;
    const page = path.split("/").pop() || 'index.html';
    const links = document.querySelectorAll('.nav-link, .dropdown-item');
    
    links.forEach(link => {
        if (link.getAttribute('href') === page) {
            link.classList.add('active');
            if (link.classList.contains('dropdown-item')) {
                const parentDropdown = link.closest('.dropdown');
                if (parentDropdown) {
                    parentDropdown.querySelector('.nav-link').classList.add('active');
                }
            }
        }
    });
}

document.addEventListener('DOMContentLoaded', loadComponents);


var checkYearExist = setInterval(function() {
    var yearElement = document.getElementById("currentYear");
    if (yearElement) {
        yearElement.textContent = new Date().getFullYear();
        clearInterval(checkYearExist); 
    }
}, 500);


function getWhatsAppMessage() {
    const path = window.location.pathname;
    const ref = document.referrer || "";

    const messages = {
        "basic-hosting": "أرغب في الاستفسار عن باقة الاستضافة الأساسية، واستفساري هو",
        "advanced-hosting": "أرغب في الاستفسار عن باقة الاستضافة المتقدمة، واستفساري هو",
        "transfer-hosting": "أرغب في نقل استضافة متجري اوبن كارت إلى سيرفر جديد وأحتاج معرفة طريقة النقل والتكلفة، وهذا رابط موقعي:",
        "free-audit": "أرغب في طلب فحص مجاني لمتجري اوبن كارت وهذا رابط المتجر الخاص بي",
        "store-upgrade": "أرغب في ترقية متجري واحتاج معرفة السعر، وهذا رابط المتجر الخاص بي"
    };

    let baseMessage = "أرغب في الاستفسار عن خدمات اوبن كارت";

    for (let key in messages) {
        if (path.includes(key)) {
            baseMessage = messages[key];
            break;
        }
    }

    if (ref.includes("google")) {
        return `السلام عليكم، وجدت موقعكم عبر جوجل و ${baseMessage}`;
    }

    return `السلام عليكم، ${baseMessage}\n`;
}

function initWhatsAppButton() {
    const btn = document.getElementById("whatsappBtn");
    if (!btn) return;

    const message = encodeURIComponent(getWhatsAppMessage());
    btn.href = `https://wa.me/966559924572?text=${message}`;

    btn.addEventListener("click", function () {
        if (typeof gtag === 'function') {
            gtag('event', 'whatsapp_click', {
                event_category: 'engagement',
                event_label: `${window.location.pathname} | whatsapp_button`
            });
        }
    });
}
