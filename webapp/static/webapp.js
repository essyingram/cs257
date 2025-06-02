/*
* webapp.js
* Essy Ingram
* 20 May 2025
*
* Adapted from Jeff's webapp and javascript samples.
*
*  A Harry Potter-themed tiny web app.
*/

window.addEventListener("load", initialize);

function initialize() {
    var element = document.getElementById('search_button');
    if (element) {
        element.onclick = onSearchButtonClicked;
    }
}

function getAPIBaseURL() {
    var baseURL =   window.location.protocol
                    + '//' + window.location.hostname
                    + ':' + window.location.port
                    + '/api';
    return baseURL;
}

// Fetches data from the user-selected tables
function onSearchButtonClicked(){
    var url = getAPIBaseURL();
    var element = document.getElementById('search_text');
    
    // User selects which tables to search (characters, spells, potions, all)
    const includeCharacters = document.getElementById('include_characters').checked
    const includeSpells = document.getElementById('include_spells').checked
    const includePotions = document.getElementById('include_potions').checked

    if ((includeCharacters && includeSpells && includePotions) || (!includeCharacters && !includeSpells && !includePotions)) {
        url += '/characters-spells-potions'
    } 
    else if (includeCharacters && includeSpells && !includePotions) {
        url += '/characters-spells'
    } 
    else if (includeCharacters && !includeSpells && includePotions) {
        url += '/characters-potions'
    } 
    else if (!includeCharacters && includeSpells && includePotions) {
        url += '/spells-potions'
    } 
    else if (includeCharacters && !includeSpells && !includePotions) {
        url += '/characters'
    } 
    else if (!includeCharacters && includeSpells && !includePotions) {
        url += '/spells'
    } else {
        url += '/potions'
    } 

    if (element){
        url += '/' + element.value;
    }

    fetch(url, {method: 'get'})

    .then((response) => response.json())

    .then(function(charactersSpellsAndOrPotions) {
        var listBody = '';
        console.log('API response:', charactersSpellsAndOrPotions);

        for (var k=0; k < charactersSpellsAndOrPotions.length; k++) {
            var item = charactersSpellsAndOrPotions[k];
            // Adds character
            if ('given_name' in item || 'surname' in item){
                listBody += '<li id="character">' + '🧙🏽 ' + item['given_name'] + ' ' + item['surname']
                        + '</li>\n';
            }
            // Adds spell
            else if ('incantation' in item || 'informal_name' in item){
                listBody += '<li id="spell">' + '🪄 ' + item['incantation'] + ' ' 
                + item['informal_name'] + '</li>\n';
            }
            // Adds potion
            else if ('name' in item){
                listBody += '<li id="potion">' + '🧪 ' + item['name'] + '</li>\n';
            }
        }
        var resultsList = document.getElementById('results-list');
        resultsList.innerHTML = listBody;

        // Give the <li> elements a click handler.
        for (var k=0; k < resultsList.children.length; k++) {
            var child = resultsList.children[k];
            child.onclick = function(e) {
                updateSelection(resultsList, this);
                // loadSpecsFor(url, this.innerText);   // TODO
            }
        }
    })

    .catch(function(error) {
        console.log(error);
    });
}


// use li IDs character, spell, or potion for API use
// function loadSpecsFor(currentUrl, selectedItem){     // TODO
//     var url = currentUrl
// }

//// Utility functions ////

function updateSelection(listElement, listItemToSelect) {
    // Assuming listElement is a <ul> or <ol>, this function will mark
    // listItemToSelect with class="selected", and ensure that no other
    // <li> elements have class="selected".
    for (var k=0; k < listElement.children.length; k++) {
        listElement.children[k].classList.remove('selected');
    }
    listItemToSelect.classList.add('selected');
}