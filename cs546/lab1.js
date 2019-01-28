const questionOne = function questionOne(arr) {
    var sum = 0;
    for(var i=0; i<arr.length; i++)
    {
        sum += arr[i] * arr[i];
    }
    return sum;
}

const questionTwo = function questionTwo(num) { 
    //fibonacci 
    if(num <= 0)
        return 0;
    else if(num == 1)
        return 1;
    else{
        return questionTwo(num-1) + questionTwo(num-2);
    }
}

const questionThree = function questionThree(text) {
    var count = 0;
    var lowerText = text.toLowerCase();
    for(var i=0; i<lowerText.length; i++)
    {
        if(lowerText.charAt(i) == 'a' || lowerText.charAt(i) == 'e' || lowerText.charAt(i) == 'i' || lowerText.charAt(i) == 'o' || lowerText.charAt(i) == 'u')
            count++;
    }
    return count;
}

const questionFour = function questionFour(num) {
    if(num < 0)
        return NaN;
    else if(num == 0 || num == 1)
        return 1;
    else
        return num * questionFour(num-1);
}

module.exports = {
    firstName: "Christopher", 
    lastName: "Rudel", 
    studentId: "10413032",
    questionOne,
    questionTwo,
    questionThree,
    questionFour
};
