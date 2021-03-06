# 비트 연산자

### AND 연산자 ( & )

AND 연산을 수행하며, 연산되는 두 값이 모두 참이어야 결과도 참을 반환한다.
```ruby
1 & 1
# => 1
 
1 & 0
# => 0

0 & 1
# => 0

0 & 0 
# => 0
```

### OR 연산자 ( | )

OR 연산을 수행하며, 연산되는 두 값 중 한 값만 참이어도 참을 반환한다.
```ruby
1 | 1
# => 1
 
1 | 0
# => 1

0 | 1
# => 1

0 | 0 
# => 0
```

### XOR 연산자 ( ^ )
OR 연산을 수행하며, 연산되는 두 값이 달라야만 참을 반환한다.
```ruby
1 ^ 1
# => 0
 
1 ^ 0
# => 1

0 ^ 1
# => 1

0 ^ 0 
# => 0
```

### NOT 연산자 ( ~ )
NOT 연산을 수행하며, 주어진 값의 부정을 반환한다.
```ruby
~ 0
# => -1 (2의 보수에 음수 부호 추가)
 
~ 1
# => -2 (2의 보수에 음수 부호 추가)
```

### SHIFT 연산자 ( >> / << )

오른쪽에 위치하는 숫자만큼 화살표 방향대로 SHIFT 된다.
```ruby
0001 << 2
# => 4 (0100)
 
4 >> 2
# => 1 (0001)
```