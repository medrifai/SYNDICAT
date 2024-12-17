// navbardyn.js

const navbarItems = [
    { label: "Administrateurs", url: "admins.html" },
    { label: "Appartements", url: "apartments.html" },
    { label: "Transactions", dropdown: [
        { label: "Opérations Bancaires", url: "bank-operations.html" },
        { label: "Prestations", url: "prestations.html" },
        { label: "Règlements", url: "reglements.html" },
    ]},
    { label: "Propriétaires", url: "proprietaires.html" },
];

function renderNavbarItems() {
    const dynamicNavbar = document.getElementById('dynamicNavbar');
    const template = document.getElementById('navbarItemTemplate').innerHTML;

    navbarItems.forEach(item => {
        if (item.dropdown) {
            // Render a dropdown item
            const dropdownTemplate = `
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">${item.label}</a>
                    <div class="dropdown-menu fade-down m-0">
                        ${item.dropdown.map(subitem => `<a href="${subitem.url}" class="dropdown-item">${subitem.label}</a>`).join('')}
                    </div>
                </div>`;
            
            dynamicNavbar.innerHTML += dropdownTemplate;
        } else {
            // Render a regular item
            const renderedItem = template.replace(/{{label}}/g, item.label).replace(/{{url}}/g, item.url);
            dynamicNavbar.innerHTML += renderedItem;
        }
    });
}

document.addEventListener('DOMContentLoaded', function () {
    renderNavbarItems();
});
