/*
* webapp.js
* Essy Ingram
* 20 May 2025
*
* Adapted from Jeff's webapp and javascript samples.
* JS/HTML list item data-type attributes: https://www.w3schools.com/tags/att_data-.asp
* JS toString() method: https://www.w3schools.com/jsref/jsref_tostring_string.asp
*
* A Harry Potter-themed web app.
*/

window.addEventListener("load", initialize);


function initialize() {
    var search = document.getElementById('search-button');
    if (search) {
        search.onclick = onSearchButtonClicked;
    }
}

function getAPIBaseURL() {
    // Gathers base URL
    var baseURL =   window.location.protocol
                    + '//' + window.location.hostname
                    + ':' + window.location.port
                    + '/api';
    return baseURL;
}

function onSearchButtonClicked(){
    // Fetches data from the user-selected tables (choose x tables from 3 choices)
    var url = getAPIBaseURL();

    // Clears specs from the previous search selection
    var search = document.getElementById('search-text');
    
    // User selects which tables to search (characters, spells, potions, all)
    const includeCharacters = document.getElementById('include-characters').checked
    const includeSpells = document.getElementById('include-spells').checked
    const includePotions = document.getElementById('include-potions').checked

    // Determines which endpoint to utilize
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

    // Adds the user-given search string to the URL if entered
    if (search){
        url += '/' + search.value;
    }

    fetch(url, {method: 'get'})

    .then((response) => response.json())

    // Uses the fetched data to populate the list of results
    .then(function(charactersSpellsAndOrPotions) { 
        var listBody = '';
        clearList(document.getElementById('specs-list'));
        clearList(document.getElementById('specs-type'));
        clearList(document.getElementById('specs-name'));

        // <li data-type="character" data-name="Albus Dumbledore">🧙🏽 Albus Dumbledore</li>

        for (var k=0; k < charactersSpellsAndOrPotions.length; k++) {
            var item = charactersSpellsAndOrPotions[k];
            // Adds character
            if ('given_name' in item || 'surname' in item){
                listBody += '<li data-type="character" data-name="' 
                            + item['id']
                            + '">'
                            + '🧙🏽 ' + item['given_name'] 
                            + ' ' + item['surname']
                            + '</li>\n';
            }
            // Adds spell
            else if ('incantation' in item || 'informal_name' in item){
                listBody += '<li data-type="spell" data-name="' 
                            + item['id']
                            + '">' 
                            + '🪄 ' + item['incantation'] + ' ' 
                            + item['informal_name'] + '</li>\n';
            }
            // Adds potion
            else if ('name' in item){
                listBody += '<li data-type="potion" data-name="' 
                            + item['id']
                            + '">' 
                            + '🧪 ' 
                            + item['name'] + '</li>\n';
            }
        }
        var resultsList = document.getElementById('results-list');
        resultsList.innerHTML = listBody;

        // Give the <li> elements a click handler.
        for (var k=0; k < resultsList.children.length; k++) {
            var child = resultsList.children[k];
            child.onclick = function(e) {
                updateSelection(resultsList, this);
                clearList(document.getElementById('specs-list'));
                loadSpecsFor(this, charactersSpellsAndOrPotions);;
            }
        }
    })

    .catch(function(error) {
        console.log(error);
    });
}



////////////// Utility functions //////////////

function loadSpecsFor(selectedItem, fetchedItems){
    // Finds spec information for display using selectedItem metadata

    // ID number of selected item
    var idNum = selectedItem.dataset.name;

    // Data type of selected item (is either "character", "spell", or "potion")
    var itemType = selectedItem.dataset.type;
    var ch = "character";
    var sp = "spell";
    var po = "potion";

    console.log('Loading specs for: ', idNum, itemType);

    var specsBody = '';
    var specsTypeBody = '';
    var specsNameBody= '';

    // Displays specifics of the chosen item
    for (var k=0; k < fetchedItems.length; k++) {
        var item = fetchedItems[k];

        // Character specs
        if (item['id'].toString() === idNum){
            if (itemType === ch && ('given_name' in item || 'surname' in item)){
                specsTypeBody += 'Character Specs'
                specsNameBody += '🧙🏽 ' + item['given_name'] + ' ' + item['surname']
                specsBody += '<li>Species: ' 
                            + item['species'] 
                            + '</li>\n<li>Gender: '
                            + item['gender']
                            + '</li>\n<li>Hair color: '
                            + item['hair_color']
                            + '</li>\n<li>Eye color: '
                            + item['eye_color']
                            + '</li>\n<li>Hogwarts house: '
                            + item['house']
                            + '</li>\n<li>Blood status: '
                            + item['blood_status']
                            + '</li>\n<li>Wand: '
                            + item['wand']
                            + '</li>\n<li>Patronus: '
                            + item['patronus']
                            + '</li>\n<li>Skills: '
                            + item['skills']
                            + '</li>';
                break;  // character found
            }

            // Spell specs
            else if (itemType === sp && ('incantation' in item || 'informal_name' in item)){ 
                specsTypeBody += 'Spell Specs'
                specsNameBody += '🪄 ' + item['incantation'] + ' ' + item['informal_name'] 
                specsBody += '<li>Spell type: '
                            + item['type'] 
                            + '</li>\n<li>Effect: '
                            + item['effect'] 
                            + '</li>\n<li>Light emitted, if known: '
                            + item['light']
                            + '</li>';
                break;  // spell found
            }

            // Potion specs
            else if (itemType === po && ('name' in item || 'difficulty' in item)){ 
                specsTypeBody += 'Potion Specs'
                specsNameBody += '🧪 ' + item['name']
                specsBody += '</li>\n<li>Known effects: '
                            + item['effect']
                            + '</li>\n<li>Known ingredients: '
                            + item['known_ingredients']
                            + '</li>\n<li>Difficulty: '
                            + item['difficulty']
                            + '</li>';
                break; // potion found
            }
        }
    }
    var specsType = document.getElementById('specs-type');
    specsType.innerHTML = specsTypeBody;

    var specsName = document.getElementById('specs-name');
    specsName.innerHTML = specsNameBody;

    var specsList = document.getElementById('specs-list');
    specsList.innerHTML = specsBody;
}

function updateSelection(listElement, listItemToSelect) {
    // Assuming listElement is a <ul> or <ol>, this function will mark
    // listItemToSelect with class="selected", and ensure that no other
    // <li> elements have class="selected".
    // Unselect a character
    if (listItemToSelect.classList.contains('selected')){
        listItemToSelect.classList.remove('selected');
    }
    else {
        for (var k=0; k < listElement.children.length; k++) {
            listElement.children[k].classList.remove('selected');
        }
        listItemToSelect.classList.add('selected');
    }
}

function clearList(listElement) {
    // Clears specifications list for the selected item
    listElement.innerHTML = '';
}