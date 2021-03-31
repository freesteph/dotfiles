(setf rcirc-server-alist '(("irc.brillance.xyz"
                            :channels ("#brillance")
                            :encryption tls
                            :port 6697)))

(rcirc-track-minor-mode 1)
