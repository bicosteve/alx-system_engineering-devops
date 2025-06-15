# alx-system_engineering-devops

```bash
alias ls='rm *'
```

It creates an alias that replaces the ls command with rm \*, meaning every time you run ls, it deletes all files in the current directory instead of listing them.

```bash
    echo "hello $(whoami)"
```

Returns the logged in user

```bash
    export PATH="$PATH:/action"
```

This command modifies the PATH environment variable by appending /action to the existing search paths.

```bash
    echo $PATH | tr ':' '\n' | grep -v '^$' | wc -l
```

echo $PATH – Prints the current PATH variable.

tr ':' '\n' – Converts colons (:) into new lines, effectively splitting the PATH into separate directories.

grep -v '^$' – Removes empty lines (in case there are consecutive colons like ::::).

wc -l – Counts the number of lines, which represents the number of directories.

```bash
    printenv
    env
```

Prints all the environment variables

```bash
    echo "=== Environment Variables ==="
    printenv

    echo -e "\n=== Local Variables ==="
    set

    echo -e "\n=== Functions ==="
    declare -F
```

printenv – Lists environment variables.

set – Lists all shell variables, including local and environment variables.

declare -F – Lists defined functions in the current shell session.

```bash
    #!/bin/bash

    BEST="School"
    echo "BEST is set to: $BEST"


```

BEST="School" – Defines a new local variable named BEST with the value "School".

echo "BEST is set to: $BEST" – Prints the variable to confirm it's set.

```bash
    #!/bin/bash
    export BEST="School"
    echo "BEST is globally set to: $BEST"
```

export BEST="School" – Makes BEST a global variable, meaning it remains available in the current shell and any subprocesses.
echo "BEST is globally set to: $BEST" – Confirms the variable was set.

```bash
    #!/bin/bash
    echo $((128 + TRUEKNOWLEDGE))
```

$((128 + TRUEKNOWLEDGE)) – Performs arithmetic addition using the value of TRUEKNOWLEDGE.
echo – Prints the result to the terminal.

```bash
    #!/bin/bash
    echo $((POWER / DIVIDE))
```

$((POWER / DIVIDE)) – Performs arithmetic division using values from POWER and DIVIDE.
echo – Prints the result to the terminal.

```bash
    #!/bin/bash
    echo "$BREATH^$LOVE" | bc
```

$BREATH^$LOVE – Performs exponentiation (BREATH raised to LOVE).
bc – A command-line calculator that evaluates the expression.

```bash
    #!/bin/bash
    echo "ibase=2; $BINARY" | bc
```

ibase=2; $BINARY – Tells bc that the input ($BINARY) is in base 2.
bc – Converts the binary number to base 10 and outputs the result.

```bash
    #!/bin/bash
    echo {a..z}{a..z} | tr ' ' '\n' | grep -v '^oo$'

```

{a..z}{a..z} – Expands to all possible two-letter combinations.
tr ' ' '\n' – Converts spaces into new lines for formatted output.
grep -v '^oo$' – Filters out "oo" from the list.

```bash
    #!/bin/bash
    printf "%.2f\n" "$NUM"
```

%.2f – Formats the number as a floating-point with two decimal places.
"$NUM" – Uses the value stored in the NUM environment variable.
\n – Ensures the output ends with a new line.
