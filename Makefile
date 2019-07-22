typing: src/conveyor-syntax.k src/conveyor-typing.k Chassis/src/chassis-typing.k Chassis/src/chassis-syntax.k
	rm -rf *kompiled
	kompile src/conveyor-typing.k --backend java
	mv src/conveyor-typing-kompiled .

execution: src/conveyor-syntax.k src/conveyor-execution.k Chassis/src/chassis-execution.k Chassis/src/chassis-syntax.k
	rm -rf *kompiled
	kompile src/conveyor-execution.k --backend java
	mv src/conveyor-execution-kompiled .

