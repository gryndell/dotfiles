function fish_prompt
    # This prompt shows:
    # - green lines if the last return command is OK, red otherwise
    # - your user name, in red if root or yellow otherwise
    # - your hostname, in cyan if ssh or blue otherwise
    # - the current path (with prompt_pwd)
    # - the current virtual environment, if any
    # - the current git status, if any, with fish_git_prompt
    # - the current battery state, if any, and if your power cable is unplugged, and if you have "acpi"
    # - current background jobs, if any

    # It goes from:
    # ┬─[nim@Hattori:~]─[11:39:00]
    # ╰─>$ echo here

    # To:
    # ┬─[nim@Hattori:~/w/dashboard]─[11:37:14]─[V:django20]─[G:master↑1|●1✚1…1]─[B:85%, 05:41:42 remaining]
    # │ 2    15054    0%    arrêtée    sleep 100000
    # │ 1    15048    0%    arrêtée    sleep 100000
    # ╰─>$ echo there

    set -l retc red
    test $status = 0; and set retc green

    set -q __fish_git_prompt_showupstream
    or set -g __fish_git_prompt_showupstream auto

    function _nim_prompt_wrapper
        set retc $argv[1]
        set -l field_name $argv[2]
        set -l field_value $argv[3]

        set_color normal
        set_color $retc
        echo -n '─'
        set_color -o green
        echo -n '['
        set_color normal
        test -n $field_name
        and echo -n $field_name:
        set_color $retc
        echo -n $field_value
        set_color -o green
        echo -n ']'
    end

    set_color $retc
    echo -n '╭──'
    set_color -o $retc
    echo -n '('

    if functions -q fish_is_root_user; and fish_is_root_user
        set_color -o red
    else
        set_color -o yellow
    end

    # $USER@
    echo -n $USER
    set_color -o white
    echo -n @

    # If SSH, show hostname in cyan
    if test -z "$SSH_CLIENT"
        set_color -o blue
    else
        set_color -o cyan
    end

    # Show hostname
    echo -n (prompt_hostname)
    set_color -o $retc
    echo -n ')'
    echo -n '─'
    echo -n '['
    set_color -o white
    echo -n (prompt_pwd --dir-length=0)
    set_color -o $retc
    echo -n ']'

    # Vi-mode
    # The default mode prompt would be prefixed, which ruins our alignment.
    function fish_mode_prompt
    end

    # Virtual Environment
    set -q VIRTUAL_ENV_DISABLE_PROMPT
    or set -g VIRTUAL_ENV_DISABLE_PROMPT true
    set -q VIRTUAL_ENV
    and _nim_prompt_wrapper $retc V (basename "$VIRTUAL_ENV")

    # git
    set -l prompt_git (fish_git_prompt '%s')
    test -n "$prompt_git"
    and _nim_prompt_wrapper $retc G $prompt_git

    # Battery status
    type -q acpi
    and test (acpi -a 2> /dev/null | string match -r off)
    and _nim_prompt_wrapper $retc B (acpi -b | cut -d' ' -f 4-)

    # New line
    echo

    # Background jobs
    set_color normal

    for job in (jobs)
        set_color $retc
        echo -n '│ '
        set_color brown
        echo $job
    end

    # Actual prompt
    set_color normal
    set_color $retc
    echo -n '╰─'
    set_color -o $retc
    echo -n '❱ '
    set_color normal
end
