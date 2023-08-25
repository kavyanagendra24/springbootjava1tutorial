//create check function 
      function check() {
        
        let inputs1 = document.getElementById('Mon');
        let inputs2 = document.getElementById('Tue');
        let inputs3 = document.getElementById('Wed');
        let inputs4 = document.getElementById('Thu');
        let inputs5 = document.getElementById('Fri');
        //let inputs6 = document.getElementById('Sat');
       // let inputs7 = document.getElementById('Sun');
       // inputs.checked = true;
        inputs1.checked = true;
        inputs2.checked = true;
        inputs3.checked = true;
        inputs4.checked = true;
        inputs5.checked = true;
       // inputs6.checked = true;
       // inputs7.checked = true;
        
              
      }
      //create uncheck function 
      function uncheck() {
        
        let inputs1 = document.getElementById('Mon');
        let inputs2 = document.getElementById('Tue');
        let inputs3 = document.getElementById('Wed');
        let inputs4 = document.getElementById('Thu');
        let inputs5 = document.getElementById('Fri');
        //let inputs6 = document.getElementById('Sat');
        //let inputs7 = document.getElementById('Sun');
        //inputs.checked = false;
        inputs1.checked = false;
        inputs2.checked = false;
        inputs3.checked = false;
        inputs4.checked = false;
        inputs5.checked = false;
       // inputs6.checked = false;
       // inputs7.checked = false;
      }
      window.onload = function() {
        window.addEventListener('load', check, false);
      }
      