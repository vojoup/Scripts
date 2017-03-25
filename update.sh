#!/bin/bash

apt autoremove -y && apt update -y && apt upgrade -y && notify-send -u low -t 30 UPDATED
