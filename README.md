# Proteum-FL

Proteum/FL is a command line fault localization tool.
To perform the fault localizaton process the following 5 steps are needed

Steps
1. Create MutantDescription file (proteumSet.pl). This step produces a description of the selected mutants.
2. execute the test suites (execute_suites_statement.pl). This step records the traces of the test suites.
3. Generate Mutants (MutantsGen.pl). This step produces and compiles the source code of the mutants.
4. Execute Mutants (execute_mutants.pl). This step executes the mutants with the selected test cases.
5. Compute Susspicious ranking (FaultLocalization.pl). This step produces the statement ranking.


The tool works on linux operating system and requires gcc, gcov, perl
Also proteum/IM and doalarm programs must be installed and set to path variable.
proteum/IM: ""
doalarm: "http://directory.fsf.org/wiki/Doalarm"


*** proteumSet.pl <options> file
	 Produces mutant descriptions

	  -D <directory>        Project Directory (source code of the program under test) 
	  -All 			apply all unit level operators 
	  -OpClass		apply Operators class Set  	
	  -Selective 		apply a Selective opeator Set  

Example: produce the selective mutants for the v1.c program which is located on path_to_fault1 directory 
perl proteumSet.pl -D path_to_fault1 -Selective v1.c


*** execute_suites_statement.pl <options> file
	  Records the Execution traces of the failing and passing tests

	  -D <directory>        Project Directory (source code of the program under test)
	  -F <name>        	Failling Test Cases
	  -P <name>      	Passing Test Cases
	  -parms <args> 	gcc arguments (optional)
	  -t <sec>        	execution timeout, (optional) default 3 sec
Example: execute the __v1.c program with the failed test cases (F_Tests_v1) and the passed test cases (P_Tests_v1) which are located on path_to_fault1 directory 
Attention __v1.c (preprocced v1.c file) required not the v1.c
perl execute_suites_statement.pl -D path_to_fault1 -F F_Tests_v1 -P P_Tests_v1 __v1.c

*** MutantsGen.pl <options> file
	  Generates and Compiles the mutants

	  -D <directory>        Project Directory (source code of the program under test) 
	  -F <name>        	Failling Test Cases
	  -parms <args> 	gcc arguments (optional)

Example: Generate the selected murants (when performed the proteumSet.pl step) of the __v1.c program which is located on path_to_fault1 directory 
Attention __v1.c required not the v1.c and the failed test cases (F_Tests_v1)
perl MutantsGen.pl -D path_to_fault1 -F  F_Tests_v1 __v1.c

*** execute_mutants.pl <options> file
	  Executes the mutants

	  -D <directory>        Project Directory (source code of the program under test) 
	  -F <name>        	Failling Test Cases
	  -P <name>      	Passing Test Cases
	  -parms <args> 	gcc arguments (optional)
	  -t <sec>        	execution timeout, (optional) default 3 sec 
	  -procs <Number>      	No of processes, (optional) default 4 sec 

Example: execute the mutants with the failed test cases (F_Tests_v1) and the passed test cases (P_Tests_v1) which are located on path_to_fault1 directory 
Attention __v1.c (preprocced v1.c file) required not the v1.c
perl execute_mutants.pl -D path_to_fault1 -F F_Tests_v1 -P P_Tests_v1 __v1.c

*** FaultLocalization.pl <options> file
	  Generate the fault localizaton results

	  -D <directory>        Project Directory (source code of the program under test)
	  -F <name>        	Failling Test Cases
	  -P <name> 		Passing Test Cases 

Example: prodeces the fault localizaton results for the failed test cases (F_Tests_v1) and the passed test cases (P_Tests_v1) which are located on path_to_fault1 directory 
perl FaultLocalization.pl -D path_to_fault1 -F F_Tests_v1 -P P_Tests_v1


Example tcas fault1
perl proteumSet.pl -D path_to_fault1 -Selective v1.c //Creates the __v1.c and mutantDescription.txt files on the path_to_fault1 directory
perl execute_suites_statement.pl -D path_to_fault1 -F F_Tests_v1 -P P_Tests_v1 __v1.c //Creates the Statement_matrix.txt file on the path_to_fault1 directory
perl MutantsGen.pl -D path_to_fault1 -F  F_Tests_v1 __v1.c //Creates the mutants on the path_to_fault1/mutants directory
perl execute_mutants.pl -D path_to_fault1 -F F_Tests_v1 -P P_Tests_v1 __v1.c //Creates the Mutant_matrix.txt file on the path_to_fault1 directory
perl FaultLocalization.pl -D path_to_fault1 -F F_Tests_v1 -P P_Tests_v1 //Creates the MutantLocalizationResults.txt file on the path_to_fault1 directory


Example tcas fault2
perl proteumSet.pl -D path_to_fault2 -Selective v2.c //Creates the __v2.c and mutantDescription.txt files on the path_to_fault2 directory
perl execute_suites_statement.pl -D path_to_fault2 -F F_Tests_v2 -P P_Tests_v2 __v2.c //Creates the Statement_matrix.txt file on the path_to_fault2 directory
perl MutantsGen.pl -D path_to_fault2 -F  F_Tests_v2 __v2.c //Creates the mutants on the path_to_fault2/mutants directory
perl execute_mutants.pl -D path_to_fault2 -F F_Tests_v2 -P P_Tests_v2 __v2.c //Creates the Mutant_matrix.txt file on the path_to_fault2 directory
perl FaultLocalization.pl -D path_to_fault2 -F F_Tests_v2 -P P_Tests_v2 //Creates the MutantLocalizationResults.txt file on the path_to_fault2 directory

## Tool Demo

The following link (Tool Demo) links to a zip file containing the Proteum/FL tool, an executable version of the Proteum/IM and doalarm tools. It also contains two examples fault1 and fault2. These are the first two versions of the tcas program.
please refer to the ReadMe file for further details.

    Tool Demo (with examples)
    Fault Localization Results fault 1 (example)
    Fault Localization Results fault 2 (example)

To avoid the need of installing Proteum/IM, the examples include the preprocessed files and the mutant description files.
They also include an executable of the doalarm and the failed and passed test cases.

To execute the first example (fault1, using the provided mutant descriptions and preprossed files) it is needed to run the following commands:

    perl execute_suites_statement.pl -D path_to_fault1 -F F_Tests_v1 -P P_Tests_v1 __v1.c //Creates the Statement_matrix.txt file on the path_to_fault1 directory
    perl MutantsGen.pl -D path_to_fault1 -F  F_Tests_v1 __v1.c //Creates the mutants on the path_to_fault1/mutants directory
    perl execute_mutants.pl -D path_to_fault1 -F F_Tests_v1 -P P_Tests_v1 __v1.c //Creates the Mutant_matrix.txt file on the path_to_fault1 directory
    perl FaultLocalization.pl -D path_to_fault1 -F F_Tests_v1 -P P_Tests_v1 //Creates the MutantLocalizationResults.txt file on the path_to_fault1 directory


To execute the Second example (fault2, using the provided mutant descriptions and preprossed files) it is needed to run the following commands:

    perl execute_suites_statement.pl -D path_to_fault2 -F F_Tests_v2 -P P_Tests_v2 __v2.c //Creates the Statement_matrix.txt file on the path_to_fault2 directory
    perl MutantsGen.pl -D path_to_fault2 -F  F_Tests_v2 __v2.c //Creates the mutants on the path_to_fault2/mutants directory
    perl execute_mutants.pl -D path_to_fault2 -F F_Tests_v2 -P P_Tests_v2 __v2.c //Creates the Mutant_matrix.txt file on the path_to_fault2 directory
    perl FaultLocalization.pl -D path_to_fault2 -F F_Tests_v2 -P P_Tests_v2 //Creates the MutantLocalizationResults.txt file on the path_to_fault2 directory



## Extra Informations

All content is the responsibility of original the authors

The original site project is available at: https://sites.google.com/site/mikepapadakis/proteum-fl

The paper is available at: http://ieeexplore.ieee.org/document/6648189/ or at: https://www.researchgate.net/publication/261096247_ProteumFL_A_tool_for_localizing_faults_using_mutation_analysis

Consider to cite the paper:
```json
@InProceedings{6648189,
	author={M. Papadakis and M. E. Delamaro and Y. Le Traon},
	booktitle={IEEE 13th International Working Conference on Source Code Analysis and Manipulation (SCAM)},
	title={Proteum/FL: A tool for localizing faults using mutation analysis},
	year={2013},
	pages={94-99},	
	doi={10.1109/SCAM.2013.6648189},
	month={Sept}
}
```