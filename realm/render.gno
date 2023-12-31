package gnosocial

import (
	"strconv"
	"strings"

	"gno.land/r/demo/users"
)

func Render(path string) string {
	if path == "" {
		return "Welcome to GnoSocial!"
	}

	parts := strings.Split(path, "/")
	if len(parts) == 1 {
		// /r/berty/social:USER_NAME
		user := users.GetUserByName(path)
		if user == nil {
			return "Unknown user: " + path
		}

		userPosts := getUserPosts(user.Address())
		if userPosts == nil {
			return "No messages for: " + path
		}

		return userPosts.RenderUserPosts()
	} else if len(parts) == 2 {
		// /r/berty/social:USER_NAME/THREAD_ID
		name := parts[0]
		user := users.GetUserByName(name)
		if user == nil {
			return "Unknown user: " + name
		}
		userPostsI, exists := gUserPostsByAddress.Get(user.Address().String())
		if !exists {
			return "No messages for: " + name
		}
		pid, err := strconv.Atoi(parts[1])
		if err != nil {
			return "invalid thread id: " + parts[1]
		}
		userPosts := userPostsI.(*UserPosts)
		thread := userPosts.GetThread(PostID(pid))
		if thread == nil {
			return "thread does not exist with id: " + parts[1]
		}
		return thread.RenderPost("", 5)
	} else if len(parts) == 3 {
		// /r/berty/social:USER_NAME/THREAD_ID/REPLY_ID
		name := parts[0]
		user := users.GetUserByName(name)
		if user == nil {
			return "Unknown user: " + name
		}
		userPostsI, exists := gUserPostsByAddress.Get(user.Address().String())
		if !exists {
			return "No messages for: " + name
		}
		pid, err := strconv.Atoi(parts[1])
		if err != nil {
			return "invalid thread id: " + parts[1]
		}
		userPosts := userPostsI.(*UserPosts)
		thread := userPosts.GetThread(PostID(pid))
		if thread == nil {
			return "thread does not exist with id: " + parts[1]
		}
		rid, err := strconv.Atoi(parts[2])
		if err != nil {
			return "invalid reply id: " + parts[2]
		}
		reply := thread.GetReply(PostID(rid))
		if reply == nil {
			return "reply does not exist with id: " + parts[2]
		}
		return reply.RenderInner()
	} else {
		return "unrecognized path: " + path
	}
}
