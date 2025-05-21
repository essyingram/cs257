/*
* potter.js
* Essy Ingram
* 20 May 2025
*
*  A Harry Potter-themed tiny web app.
*/

window.addEventListener("load", initialize);

function initialize() {
    var element = document.getElementById('characters_button');
    if (element) {
        element.onclick = onCharactersButton;
    }

    var element = document.getElementById('spells_button');
    if (element) {
        element.onclick = onSpellsButton;
    }

    var element = document.getElementById('potions_button');
    if (element) {
        element.onclick = onPotionsButton;
    }
}

function getAPIBaseURL() {
    var baseURL = window.location.protocol
                    + '//' + window.location.hostname
                    + ':' + window.location.port
                    + '/api';
    return baseURL;
}

function onCharactersButton() {
    var url = getAPIBaseURL() + '/characters/';

    fetch(url, {method: 'get'})

    .then((response) => response.json())

    .then(function(characters) {
        var listBody = '';
        for (var k = 0; k < characters.length; k++) {
            var ch = characters[k];
            listBody += '<li>' + ch['given_name'] + ' ' + ch['surname']
                      + '<br>' + ch['house']
                      + '</li>\n';
        }

        var itemListElement = document.getElementById('item_list');
        if (itemListElement) {
            itemListElement.innerHTML = listBody;
        }
    })

    .catch(function(error) {
        console.log(error);
    });
}

function onSpellsButton() {
    var url = getAPIBaseURL() + '/spells/';

    fetch(url, {method: 'get'})

    .then((response) => response.json())

    .then(function(spells) {
        var listBody = '';
        for (var k = 0; k < spells.length; k++) {
            var spell = spells[k];
            listBody += '<li>' + spell['informal_name']
                      + '<br>' + spell['incantation']
                      + '<br>' + spell['type']
                      + '<br>' + spell['effect']
                      + '</li>\n';
        }

        var itemListElement = document.getElementById('item_list');
        if (itemListElement) {
            itemListElement.innerHTML = listBody;
        }
    })

    .catch(function(error) {
        console.log(error);
    });
}

function onPotionsButton() {
    var url = getAPIBaseURL() + '/potions/';

    fetch(url, {method: 'get'})

    .then((response) => response.json())

    .then(function(potions) {
        var listBody = '';
        for (var k = 0; k < potions.length; k++) {
            var potion = potions[k];
            listBody += '<li>' + potion['name']
                      + '<br>' + potion['effect']
                      + '<br>' + potion['known_ingredients']
                      + '</li>\n';
        }

        var itemListElement = document.getElementById('item_list');
        if (itemListElement) {
            itemListElement.innerHTML = listBody;
        }
    })

    .catch(function(error) {
        console.log(error);
    });
}