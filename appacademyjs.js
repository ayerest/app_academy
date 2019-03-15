let callback = function () {
    console.log('It has been 5 seconds');
}

let timeToWait = 5000;

// global.setTimeout(callback, timeToWait);
// fyi don't do "callback()" here -- that is because callback() would actually be the returned value of the function, which is undefined

//more common way to write this is below

// global.setTimeout(function() {
//     console.log('It has been 5 seconds.');
// }, 5000);

// ^^ this is ES5 syntax


// ES6 way is below (preferred syntax)

global.setTimeout(() => console.log("It has been 4 seconds"), 4000);  

//parentheses would have any arguments that we could potentially pass 
//if the function had multiple lines of code you would need to pass it in curly braces