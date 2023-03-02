CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -f ListExamples.java ]]
then
    echo 'ListExamples found'
else 
    echo 'ListExamples not found'
    exit 1
fi

cd ..
cp TestListExamples.java student-submission
cd student-submission

javac -cp ".;../lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
exit_code = $?
if [[ $status -ne 0]]
then
    echo 'Compile Error'
    exit 1
fi

java -cp ".;../lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples
other_exit_code = $?
