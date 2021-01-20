document.addEventListener("thrbolinks:load", function(){

   var notification = document.querySelector('.global-notification');

   if (notification){
       window.setTimeout(function(){
           notification.style.display = "none";
       }, 4000);
   }
});