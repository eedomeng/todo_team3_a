let user = JSON.parse(localStorage.getItem('user'));

let addUser = ev => {
    if(ev.keyCode == 13){
        if(!inp.value) return;

        let user = {
            name:inp.value
        }

        localStorage.setItem('user', JSON.stringify(user));
        location.reload();
    }
}

let findTodoAboutUser = todo => {
    let userTodo = todo.filter(e => {
        return e['user'].name == user.name
    })[0];

    return userTodo;
}

let addTodo = ev => {
    if(ev.keyCode == 13){
        if(!inp.value) return;

        let todo = JSON.parse(localStorage.getItem('todo'));

        if(!todo){
            let todo = [{'user':user, items:[inp.value]}]; // 배열객체
            localStorage.setItem('todo', JSON.stringify(todo));
            inp.value = '';
            renderTodo();
            return;
        }

        let userTodo = findTodoAboutUser(todo);

        if(!userTodo){
            let todoItem = {'user':user, items:[inp.value]};
            todo.push(todoItem);
            localStorage.setItem('todo', JSON.stringify(todo));
            inp.value = '';
            renderTodo();
            return;         
        }

        if(userTodo.items.length >= 5) {
            alert('5개 까지만 등록이 가능합니다.');
            inp.value = '';
            return;
        }

        userTodo.items.push(inp.value);
        localStorage.setItem('todo', JSON.stringify(todo));
        inp.value = '';
        renderTodo();
    }
}

let renderTodo = () => {

    let todos = JSON.parse(localStorage.getItem('todo'));

    if(!todos) return;

    let userTodo = findTodoAboutUser(todos);

    todoList.innerHTML = '';
    userTodo.items.forEach((e,i) => {
        console.dir(e);
        let icon = createElement('i', {prop:{className:'fa-solid fa-trash-can'}});
        let item = createElement('li', {prop:{className:'item'}, text:` ${e}`});

        icon.addEventListener('click', ev => {
            userTodo.items.splice(i,1);
            localStorage.setItem('todo', JSON.stringify(todos));
            renderTodo();
        });

        item.prepend(icon);
        todoList.append(item)
    })
}

let renderTime = () => {
    setInterval(() => {
        let now = new Date();
        let hour = now.getHours();
        let minute = now.getMinutes();
        let second = now.getSeconds();

        hour = hour > 9?hour:'0'+hour;
        minute = minute > 9?minute:'0'+minute;
        second = second > 9?second:'0'+second;

        let timeText = `${hour} : ${minute} : ${second}`;
        nowTime.innerHTML = timeText;
    }, 1000);
}

if(user){
    userDiv.append(createElement('span',{text:`안녕하세요! ${user.name}`}));

    let logout = createElement('span',{prop:{className:'logout'}, text:`logout`});
    
    logout.addEventListener('click', ev => {
        localStorage.removeItem('user');
        location.reload();
    })

    userDiv.append(logout);
    
    inp.placeholder = '할 일을 작성하세요.';
    inp.addEventListener('keyup', addTodo);
    renderTodo();

    } else{
        inp.addEventListener('keyup', addUser);
    } 

    renderTime();