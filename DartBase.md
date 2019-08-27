# 常量
- `const`, `final`
```
const PI = 3.1415926;
final PI = 3.1415926;
```
# String 字符串
- `isEmpty`,
```
String str = '1+1=${1+1}'; // 1+1=2
```

# int 整形

```
var myNum = int.parse('123');

if (myNum.isNaN) {}
```

# double 浮点数
```
var d1 = double.parse('123');
var d2 = double.parse('123.1');
```

# bool
- `true`, `false`

# List 数组
- `lenght`, `isEmpty`, `isNotEmpty`, `reversed`
- `add()`, `addAll([])`, `indexOf()`, `remove()`, `removeAt(index)`, `fillRange()`, `insert()`, `insertAll()`, `join()`, `slit()`, `forEach()`, `map()`, `any()`, `every()`
```
var l1 = [1, 2, 3, 4, 5];
print(l1[1]);

var l11 = l1.reversed.toList();

varl2 = new List();
l2.add(1);
l2.add(2);

// 指定类型 只能存放String类型
var l3 = new List<String>();
```

# Set 元素不允许重复
```
var s = new Set();

var list = s.toList; // 转换成数组

```

# Map 字典
- `keys`, `values`, `isEmpty`, `isNotEmpty`
- `addAll()`, `remove(key)`, `containsKey()`, `containsValue()` 
```
var person = {"name": "zhangsan", age: 20, "work": ["程序员", "送外卖"]};

var p = new Map();
p['name'] = '张三';
p['age'] = 20;
p['work'] = ["程序员", "送外卖"];

print(p.keys.toList());
print(p.values.toList());


```

# 类型判断
- `is`
```
var str = '123';
if (str is String) {
  print('String');
} else if (str is int) {
  console.log('int')
} else {
  console.log('其他类型')
}
```

# 运算符
- `+`, `-`, `*`, `/`, `%`取余, `~/`取整, `>`, `<`, `>=`, `<=`, `==`, `!`, `&&`, `||`, `=`, `??=`, 
`+=`, `-=`, `*=`, `/=`, `%=`, `~/=`, `++`, `--`,

```
int a = 10;
int b ??= a;  // b为空的时候将a的值给b
print(b); 
```

# 三目运算符 `??`

```
var a = 22;
var c = a ?? 33;
```

# if else,  switch case
```
if () {}
else if () {}
else () {}

switch(gender) {
    case 'male':
        break;
    case 'female':
        break;
    default: 
        print('参数错误');
}
```

# try {} catch (err) {}

# 循环
- `for`, `while`
```
for (int i = 0; i < 10; i++) {
    print(i);
    continue;
}
while(){
  break;
}

do {
} while()
```



