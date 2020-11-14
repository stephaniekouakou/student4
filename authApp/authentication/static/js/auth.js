const showPasswordToogle = document.querySelector(".showPasswordToogle");
const passwordfield= document.querySelector(".passwordfield")

const handleToggleInput = (e) =>{
    if (showPasswordToogle.textContent==="SHOW"){
        showPasswordToogle.textContent="HIDE";
    }else{
        showPasswordToogle.textContent ="SHOW";
    }
};
showPasswordToogle.addEventListener("click", handleToggleInput);


