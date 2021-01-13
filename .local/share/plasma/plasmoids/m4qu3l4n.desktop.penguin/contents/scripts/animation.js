var config; // Aquí se guardará la configuración del archivo de configuración
var forewardImages = [];
var penguinImages = [];
var penguinTurnImages = [];
var bodyRotation = new Object({'foreward':0, 'bacward':0, 'up':270, 'down':90})
var leftBorder = 240;
var rightBorder = 640;
var topBorder = 480;
var bottomBorder = 0;
var image_number = getRandom(1, 10);
var body_move = true;

var lastImage = 1;
var cursorX = 0;// La variable se ha movido aquí para que no cambie más, porque la próxima vez que acceda a ella, el cursor puede estar en otro lugar, lo que causará confusión
var cursorY = 0;// La variable se mueve aquí para que no cambie más

function initialize(){
  config = readConfigurationFile(); //Читаем настройки из файла конфигурации
  cursorX = config.xCursorPos;//По положению курсора узнаем куда пользователь поместил плазмоид так как в момент инициализации плазмоида курсор все еще будет над ним
  cursorY = config.yCursorPos;
  rightBorder = config.screenWidth -cursorX;
  leftBorder = -cursorX;
  topBorder = cursorY -config.screenHeight;
  bottomBorder = config.screenHeight -cursorY;
  reload();        
  
}

var bodyRotation = new Object({'foreward':0, 'bacward':0, 'up':270, 'down':90})


function reload(){

  var type = plasmoid.configuration.type;// Para que el caracol responda inmediatamente a un nuevo valor de velocidad
  
  for (var i=1; i < 22; i+=1) {
        forewardImages[i] = '../images/'+ type + '/foreward_' + i + '.png';
      }
      
  for (var i=1; i < 22; i+=1) {
        penguinImages[i] = '../images/'+ type + '/bacward_' + i + '.png';
      }  
      
  for (var i=1; i < 21; i+=1) {
        penguinTurnImages[i] = '../images/'+ type + '/turn_' + i + '.png';
      }  
      
	  body.width = plasmoid.height;
      body.height = plasmoid.height;  
      turn_around.width = plasmoid.height;
      turn_around.height = plasmoid.height;
      
      
}


function readConfigurationFile(){
   var configEntry = {};
   configEntry.screenWidth = plasmoid.configuration.availableWidth;
   configEntry.screenHeight = plasmoid.configuration.availableHeight;
   configEntry.shellRotationLevel = plasmoid.configuration.shellRotationLevel;
   configEntry.xCursorPos = plasmoid.configuration.xCursorPos;
   configEntry.yCursorPos = plasmoid.configuration.yCursorPos;
   return configEntry;
}


function animate(){
      reload();        
      var previos_img = lastImage;
      var current_img = image_number;
      var current_direction = defineDirection();
      
	  if(image_number < 22){
        if(current_direction == 'foreward'){
           body.source = forewardImages[current_img];
        }
        else{
            body.source = penguinImages[current_img];
        }
        lastImage = current_img;
	    image_number += 1;
	  }
	  else{
	    image_number = 1;
	  }   
	  
 
 }


function move(){
  var speed = plasmoid.configuration.speed;// Para que el caracol responda inmediatamente a un nuevo valor de velocidad
  var current_direction = defineDirection();
  
  if(body_move == true){
           speed = plasmoid.configuration.speed;
        }
        else{
            speed = 0;
        }
  
  
  switch(current_direction){
      

    case 'foreward':
      body.rotation = bodyRotation['foreward'];
      //shell.rotation = 0;
      //shell.scale = (-1,-1);
      body.x += speed;


      //shell.x += speed;
    break 
    case 'bacward':
      body.rotation = bodyRotation['bacward'];
      //shell.rotation = 0;
      body.x -= speed;
      //shell.x -= speed;
    break
    case 'up':
      body.rotation = bodyRotation['up'];
      //shell.rotation = 180;
      body.y -= speed;
      //shell.y -= speed;
    break
    case 'down':
      body.rotation = bodyRotation['down'];
      //shell.rotation = 0;
      body.y += speed;
      //shell.y += speed;
    break
  }
}

if (getRandom(1, 3) == 1){
    var direction = 'foreward'; }
else{
	var direction = 'bacward';
	}


 
function defineDirection(){
// Si el dibujo animado ha llegado al borde, invierta su dirección
  var availableDirections = ['foreward', 'bacward', 'up', 'down'];
  var current_direction = 'foreward';
  
   if (body.x < leftBorder||
        body.x > rightBorder||
        body.y < topBorder||
        body.y > bottomBorder
       ){
          current_direction = availableDirections[getRandom(0, 2)];
          direction = current_direction;
          print('Now I going to moving ' + current_direction + "; leftBorder = " + leftBorder + "; rightBorder = " + rightBorder)
          image_number = 1;// Señala el primer fotograma de la difusión de animación
	      preventTrimig();
          switchBehavior('turne_around');// Cambiar a giro en U
        }
        else{
		  current_direction = direction;
	    }
  
  return current_direction;
}

function switchBehavior(behavior){
	
	switch(behavior){
		
		case 'crawl':
		    turn_around.visible = false;
			body.visible = true;
			//shell.visible = true;
			hiding_animation.running = false;
			turn_around_animation.running = false;
			crawl_animation.running = true;
	        body_move = true;
            
	    break
	    
	    case 'turne_around':
	        body_move = false;
	        body.visible = false;
	        //shell.visible = true;
			turn_around.visible = true;
			crawl_animation.running = false;
			hiding_animation.running = false;
			turn_around_animation.running = true;
			
         break
         
         case 'hide_into_the_shell':
          
            crawl_animation.running = false;
            image_number = 21;
            hiding_animation.running = true;
           
         break
         
		}
	
}

function turnAround(){
    // Animación de giro en U
    
    reload();        

    var previos_img = lastImage;
    var current_img = image_number;
	  if(image_number < 20){
           turn_around.source = penguinTurnImages[current_img];
	       lastImage =  current_img;
	       image_number += 1;
	     }
	     
	     else{
	    
	    image_number = 1;
	    switchBehavior('crawl')// Cuando nos desplazamos por toda la animación de giro en U, reanudamos el movimiento
	    
	  }
	  
}
	
function hideIntoTheShell(){
	//Улитка прячется в раковину
    reload();        

	var previos_img = lastImage;
    var current_img = image_number;
        
	  if(image_number < 20){
         body.source = forewardImages[current_img];
	     lastImage =  current_img;
	     image_number += 1;
	     }
	     
	   else{
	    image_number = 1;
	    hiding_animation.running = false;
	   }
}

function preventTrimig(){
	if(leftBorder > body.x){
		leftBorder = body.x
		}
	if(rightBorder < body.x){
		rightBorder = body.x
		}
	if(topBorder > body.y){
		topBorder = body.y
		}
	if(bottomBorder < body.y){
		bottomBorder = body.y
		}
	 
	 turn_around.x = body.x;
	 turn_around.y = body.y;
     
    reload();        
	}

function definrBorders(){
  
   leftBorder = getRandom(-cursorX, config.screenWidth/2);
   rightBorder = getRandom(config.screenWidth/2, config.screenWidth -cursorX);
   topBorder = getRandom(-cursorY, config.screenHeight/4);
   bottomBorder = getRandom((config.screenHeight -cursorY)/2, (config.screenHeight -cursorY))
   print("current borders: left = " + leftBorder + "; right = " + rightBorder + "; top = " + topBorder + "; bottom = " + bottomBorder);
   
}

var wiggle = 'left';

function shellWiggle(){
	var rotationLevel = config.shellRotationLevel;
	
	if(wiggle == 'right'){
	 //shell.rotation += rotationLevel;
	 wiggle = 'left';
	 }
	else{
	  //shell.rotation -= rotationLevel;
	  wiggle = 'right';
	}
}

function getRandom(min, max) {
  return Math.floor(Math.random() * (max - min)) + min;
}

