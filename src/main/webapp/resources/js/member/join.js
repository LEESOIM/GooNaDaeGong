const joinbtn = document.getElementById("joinbtn");
const frmjoin = document.getElementById("frmjoin");
const user_id = document.getElementById("user_id");
const user_pw = document.getElementById("user_pw");
const user_pw2 = document.getElementById("user_pw2");
const user_name =document.getElementById("user_name");
const user_email = document.getElementById("user_email");
const user_phone = document.getElementById("user_phone");
const user_post = document.getElementById("user_post");
const user_addr = document.getElementById("user_addr");
const user_addr2 = document.getElementById("user_addr2");
const userfile = document.getElementById("userfile");
// js 체크
const id_check =document.getElementById("id_check");
const pw_check =document.getElementById("pw_check");
const pw2_check = document.getElementById("pw2_check");
const name_check = document.getElementById("name_check");
const email_check = document.getElementById("email_check");
const phone_check = document.getElementById("phone_check");
const post_check = document.getElementById("post_check");
const addr_check =document.getElementById("addr_check");
const addr2_check =document.getElementById("addr2_check");
const file_check = document.getElementById("file_check");
//약관동의
const all = document.querySelector("#all");
const agrees = document.querySelectorAll(".agrees");
const req = document.getElementsByClassName("req");
//중복체크
const ajaxID = document.getElementById("ajaxID");
const ajaxEmail = document.getElementById("ajaxEmail");

//정규식

//아이디 정규식
var idJ = /^[a-z0-9][a-z0-9_\-]{4,12}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
// 이름 정규식
var nameJ = /^[a-z0-9가-힣]{3,12}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;


//check 결과
let idCheck = false;
let pwCheck = false;
let pw2Check = false;
let nameCheck = false;
let emailCheck = false;
let phoneCheck = false;
let postCheck = false;
let addrCheck =false;
let addr2Check = false;
let fileCheck = false;
let agreeCheck =false;

//아이디
user_id.addEventListener("blur",function(){
    console.log("아이디 체크해라")
    idCheck = false;
    if(idJ.test(user_id.value)){ //조건식부분
        id_check.innerHTML ="";
        idCheck = true;
    }else{
        id_check.innerHTML="5~12자의 영문, 숫자만 사용 가능합니다.";
    }   
});

//비밀번호
user_pw.addEventListener("blur",function(){
    console.log("비밀번호 체크해라");
    pwCheck = false;
    if(pwJ.test(user_pw.value)){
        pw_check.innerHTML="";
        pwCheck = true;
    }else{
        pw_check.innerHTML ="4~12자의 숫자 , 문자로만 사용 가능합니다.";
        
    }
});

//pw가 같은지 check
user_pw2.addEventListener("blur",function(){
    console.log("비밀번호 같은지 체크하셈");
    pw2Check= false;
    if(user_pw2.value == user_pw.value){
        pw2_check.innerHTML="";
        pw2Check= true;
    }else{
        pw2_check.innerHTML="비밀번호가 일치하지 않습니다.";
        
    }
});

//이름
user_name.addEventListener("blur",function(){
    console.log("이름 체크해라");
    nameCheck= false;
    if(user_name.value.length>1){
        name_check.innerHTML="";
        nameCheck=true;
    }else{
        name_check.innerHTML="이름을 입력해주세요.";
        
    }
});

//이메일
user_email.addEventListener("blur",function(){
    console.log("이메일 체크해라");
    emailCheck=false;
    if(mailJ.test(user_email.value)){
        email_check.innerHTML="";
        emailCheck =true;
    }else{
        email_check.innerHTML="이메일 양식을 확인해주세요.";
        
    }
});

//핸드폰
user_phone.addEventListener("blur",function(){
    console.log("핸드폰 체크");
    phoneCheck = false;
    if(user_phone.value.length>1){
        phone_check.innerHTML= "";
        phoneCheck = true;
    }else{
        phone_check.innerHTML="핸드폰 조건식";
        
    }
});
//우편번호
user_post.addEventListener("blur",function(){
    console.log("님 우편번호 확인이요");
    postCheck =false;
    if(user_post.value != ""){
        post_check.innerHTML="";
        postCheck = true;
    }else{
        post_check.innerHTML="주소검색 버튼을 눌러주세요.";
    }
});

//주소1
user_addr.addEventListener("blur",function(){
    console.log("주소 체크");
    addrCheck =false;
    if(user_addr.value.length>1){
        addr_check.innerHTML="";
        addrCheck = true;
    }else{
        addr_check.innerHTML="주소검색 버튼을 눌러주세요";
    }   
});

//주소2
user_addr2.addEventListener("blur",function(){
    console.log("상세주소 체크");
    addr2Check =false;
    if(user_addr2.value.length>1){
        addr2_check.innerHTML="";
        addr2Check =true;
    }else{
        addr2_check.innerHTML ="상세주소 조건식";
        
    }
});

//파일
userfile.addEventListener("change",function(){
    console.log("프로필 파일 넣을거람슈 ㅇㅅㅇ");
    if(userfile.value==""){
        file_check.innerHTML="";
    }else{
        file_check.innerHTML= userfile.value;
    }
});


//----------------------------약관동의--------------
//전체동의
all.addEventListener("click",function(){
    const img = document.getElementsByClassName("css-1wfsi82");
    console.log("전체동의 체크 되나?")
    console.log('전체 체크==',all.checked);
    if(all.checked){
        img[0].setAttribute("src","/resources/images/member/checked.svg")
        for(let x=0; x<agrees.length; x++){
            img[x].setAttribute("src","/resources/images/member/checked.svg");
        }
    }else if(!all.checked){
        img[0].setAttribute("src","/resources/images/member/check.svg");
        for(let t=0; t<agrees.length; t++){
            img[t].setAttribute("src","/resources/images/member/check.svg");
        }
    }else{
        console.log("뭐야 왜안되는거임");
    }
    for(let i=0; i<agrees.length; i++){
        agrees[i].checked = all.checked
      
    }
});
//일반동의
for(let a=0; a<agrees.length; a++){
    agrees[a].addEventListener("click",function(){
        const img = document.getElementsByClassName("css-1wfsi82");
        console.log("a=",agrees[a].checked)
        let checked = {
            open:"/resources/images/member/check.svg",
            close:"/resources/images/member/checked.svg"
        }
        
        agrees[a].checked ?  img[a].setAttribute("src",checked.close) : img[a].setAttribute("src",checked.open)
        let result = true;
        for(let y=0; y<agrees.length; y++){
            console.log("y=",agrees[y].checked)
            if(!agrees[y].checked){
                img[0].setAttribute("src","/resources/images/member/check.svg");
                result = false;
                break;
            }else{
                img[0].setAttribute("src","/resources/images/member/checked.svg");
                agreeCheck = true;
            }
        }
        all.checked = result;
    });
}

//필수약관만 선택해서 동의
joinbtn.addEventListener("click",function(){
    for(let i= 0; i<req.length; i++){
        console.log(req.length);
        console.log(req[i].checked);
        if(!req[i].checked){
            agreeCheck = false;
            break;
        }else{
            agreeCheck = true;
        }
    }
    if(idCheck&&pwCheck&&pw2Check&&nameCheck&&emailCheck&&phoneCheck&&addrCheck&&addr2Check&&agreeCheck){
        frmjoin.submit();
    }else{
        alert("필수 사항을 모두 체크 해주세요.");
    }
});


// -------------------------------------중복체크
ajaxID.addEventListener("click",function(){
    console.log("이제 아이디 중복 검사할거임")
    let userID = user_id.value;
    //1.XMLHTTPRequest 생성
    const xhttp = new XMLHttpRequest();
    //2.method,url 요청정보
    xhttp.open("POST","./ajaxID");
    //3.Enctype
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    //4.post 파라미터 전송
    xhttp.send("user_id="+userID);
    //5.요청발생
    xhttp.onreadystatechange=function(){
        if(xhttp.readyState==4 && xhttp.status==200){
            console.log(userID);
            console.log(xhttp.responseText);
            let result = xhttp.responseText.trim();

            if(result == 1){
                id_check.innerHTML ="중복된 아이디 입니다.";
                user_id.focus();
            }else{
                id_check.innerHTML = "사용 가능한 아이디 입니다.";
            }

        }
    }
})//ajaxID

ajaxEmail.addEventListener("click",function(){
    console.log("이메일 중복검사 실행 해야함")
    let userEmail = user_email.value;

    //1.XMLHTTPRequest 생성
    const xhttp = new XMLHttpRequest();
    //2.method,url 요청정보
    xhttp.open("POST","./ajaxEmail");
    //3.Enctype
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    //4.post 파라미터 전송
    xhttp.send("user_email="+userEmail);
    //5.요청발생
    xhttp.onreadystatechange=function(){
        if(xhttp.readyState==4 && xhttp.status==200){
            console.log(userEmail);
            console.log(xhttp.responseText)
            let result = xhttp.responseText.trim();
            if(result == 1){
                email_check.innerHTML= "중복된 이메일입니다.";
            }else{
                email_check.innerHTML= "사용 가능한 이메일 입니다."
            }
        }
    }

});


