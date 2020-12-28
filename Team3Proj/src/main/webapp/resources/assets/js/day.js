var today = new Date();
            var day= document.getElementById('day');
            switch(today.getDay()){
                case 0:day.innerHTML='느릿느릿 일요일과 어울리는';break;
                case 1:day.innerHTML='월요일엔 색다르게';break;
                case 2:day.innerHTML='화요일이니까, 오늘은';break;
                case 3:day.innerHTML='수요일엔 색다르게';break;
                case 4:day.innerHTML='목요일이니까, 오늘은';break;
                case 5:day.innerHTML='불타는 금요일엔';break;
                case 6:day.innerHTML='꿀 같은 토요일은';break;
}