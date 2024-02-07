

function dateDiff() {
    let birthday = document.getElementById("bday").value;
    let today = new Date();
    let bday = new Date(birthday);
    let time = Math.abs(today - bday);
    let daysOld = Math.floor(time /(1000 * 60 * 60 * 24));
    return daysOld;

}

function yearDiff() {
    let birthday = document.getElementById("bday").value;
    let today = new Date();
    let bday = new Date(birthday);
    let time = Math.abs(today - bday);
    let yearsOld = Math.floor(time /(1000 * 60 * 60 * 24 * 365.25))
    return yearsOld;
}

function dogYearDiff() {
    let birthday = document.getElementById("bday").value;
    let today = new Date();
    let bday = new Date(birthday);
    let time = Math.abs(today - bday);
    let dogYears = Math.floor(time /(1000 * 60 * 60 * 24 * 365.25)*7)
    return dogYears;
}


function dayCalc() {
    let daysOld = dateDiff(birthday);
    document.getElementById("days").innerHTML = "You are " + daysOld + " days old!"
    
};

function yearCalc() {
    let yearsOld = yearDiff(birthday);
    document.getElementById("years").innerHTML = "You are " + yearsOld + " years old!"
};

function dogYearCalc() {
    let dogYears = dogYearDiff(birthday);
    document.getElementById("dogYears").innerHTML = "You are " + dogYears + " years old in dog years!"
}