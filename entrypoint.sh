#!/bin/sh
# Copyright (c) 2023 Miguel Angel Rivera Notararigo
# Released under the MIT License

set -e

UID="${UID:-"1000"}"
USER="${USER:-"ntrrg"}"
GROUPS="${GROUPS:-"audio video"}"

echo "creating user '$USER' ($UID)..."

useradd --create-home --uid "$UID" --user-group "$USER"

for _group in $GROUPS; do
	if echo "$_group" | grep -q '^[0-9]\+$'; then
		_group_name="$(getent group "$_group" || echo "")"
		_group_name="$(echo "$_group_name" | sed "s/:.*//")"

		if [ -z "$_group_name" ] ; then
			echo "creating group 'group-$_group' ($_group)..."

			groupadd --gid "$_group" "group-$_group"
			_group="group-$_group"
		else
			echo "using group '$_group_name' ($_group)..."

			_group="$_group_name"
		fi
	elif ! getent group "$_group"; then
		echo "creating group '$_group'..."

		groupadd "$_group"
	fi

	usermod --append --groups "$_group" "$USER"
done

exec su -c "$*" "$USER"
