var foods = document.getElementsByClassName('food');
var foodArray = [];
var currentFood = 0;

foods[currentFood].style.opacity = 1;
for (var i = 0; i < foods.length; i++) {
    splitLetters(foods[i]);
}

function changeFood() {
    var cf = foodArray[currentFood];
    var nf = currentFood == foods.length-1 ? foodArray[0] : foodArray[currentFood+1];
    for (var i = 0; i < cf.length; i++) {
        animateLetterOut(cf, i);
    }

    for (var i = 0; i < nf.length; i++) {
        nf[i].className = 'letter behind';
        nf[0].parentElement.style.opacity = 1;
        animateLetterIn(nf, i);
    }

    currentFood = (currentFood == foodArray.length-1) ? 0 : currentFood+1;
}

function animateLetterOut(cf, i) {
    setTimeout(function() {
        cf[i].className = 'letter out';
    }, i*80);
}

function animateLetterIn(nf, i) {
    setTimeout(function() {
        nf[i].className = 'letter in';
    }, 340+(i*80));
}

function splitLetters(food) {
    var content = food.innerHTML;
    food.innerHTML = '';
    var letters = [];
    for (var i = 0; i < content.length; i++) {
        var letter = document.createElement('span');
        letter.className = 'letter';
        letter.innerHTML = content.charAt(i);
        food.appendChild(letter);
        letters.push(letter);
    }

    foodArray.push(letters);
}

changeFood();
setInterval(changeFood, 2800);