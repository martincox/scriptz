#!/bin/bash

for i in deps/*
    do
        GIT_DIR=$i/.git
        CHECKED_OUT_TAG=`git --git-dir $GIT_DIR describe --tags`
        REBAR3=`git --git-dir $GIT_DIR show-ref origin/rebar3`
        if [ -n "$REBAR3" ]; then
            REBAR3_REPO_TAG=`git --git-dir $GIT_DIR describe --tags origin/rebar3`
            DIFF_COMMITS=`git --git-dir $GIT_DIR rev-list --count HEAD..origin/rebar3`
            echo $i: $CHECKED_OUT_TAG", "$REBAR3_REPO_TAG", "$DIFF_COMMITS
        fi
    done
