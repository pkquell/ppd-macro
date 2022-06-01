listlines off
sendmode input
setkeydelay -1

csinput := 0
csinput_btn_status = := 0

btn1_status := 0
btn2_status := 0
btn3_status := 0
btn4_status := 0
pov1_status := 0
pov2_status := 0
pov3_status := 0
pov4_status := 0
joyll_status := 0
joylr_status := 0
joyrl_status := 0
joyrr_status := 0
l1_status := 0
r1_status := 0
l2_status := 0
r2_status := 0
u_entry := "n"
h_entry := "n"
j_entry := "n"
k_entry := "n"

loop {
	
	csinput_btn_new_status := getkeystate("joy9")
	if (csinput_btn_status = 0) and (csinput_btn_new_status = 1) {
		btn1_status := 0
		btn2_status := 0
		btn3_status := 0
		btn4_status := 0
		pov1_status := 0
		pov2_status := 0
		pov3_status := 0
		pov4_status := 0
		joyll_status := 0
		joylr_status := 0
		joyrl_status := 0
		joyrr_status := 0
		l1_status := 0
		r1_status := 0
		l2_status := 0
		r2_status := 0
		u_entry := "n"
		h_entry := "n"
		j_entry := "n"
		k_entry := "n"
		if (csinput = 0) {
			csinput := 1
			HideTrayTip()
			TrayTip, Macro ON, Dpad = Shapes, 1.5
			;tooltip, Macro ON`r`n`r`nDpad = Shapes
			;settimer, cleartooltip, 1500
		} else {
			csinput := 0
			HideTrayTip()
			TrayTip, Macro OFF, Dpad = Dpad, 1.5
			;tooltip, Macro OFF`r`n`r`nDpad = Dpad
			;settimer, cleartooltip, 1500
		}
	}
	csinput_btn_status := csinput_btn_new_status
	
	btn1_new_status := getkeystate("joy1")
	btn2_new_status := getkeystate("joy2")
	btn3_new_status := getkeystate("joy3")
	btn4_new_status := getkeystate("joy4")
	
	pov := getkeystate("joypov")
	pov1_new_status := 0
	pov2_new_status := 0
	pov3_new_status := 0
	pov4_new_status := 0
	if (pov >= 22500) and (pov <= 31500)
		pov1_new_status := 1
	if (pov >= 13500) and (pov <= 22500)
		pov2_new_status := 1
	if (pov >= 4500) and (pov <= 13500)
		pov3_new_status := 1
	if (pov >= 0) and (pov <= 4500) or (pov >= 31500)
		pov4_new_status := 1
	
	joyl := getkeystate("joyx")
	joyr := getkeystate("joyz")
	joyll_new_status := 0
	joylr_new_status := 0
	joyrl_new_status := 0
	joyrr_new_status := 0
	if (joyl <= 25)
		joyll_new_status := 1
	else if (joyl >= 75)
		joylr_new_status := 1
	if (joyr <= 25)
		joyrl_new_status := 1
	else if (joyr >= 75)
		joyrr_new_status := 1
	
	l1_new_status := getkeystate("joy5")
	r1_new_status := getkeystate("joy6")
	l2_new_status := getkeystate("joy7")
	r2_new_status := getkeystate("joy8")
	
	;;;;; btn
	
	if (btn1_status = 0) and (btn1_new_status = 1) {
		btn1_status := 1
		if (not h_entry = "n")
			send {h up}
		send {h down}
		h_entry := "btn1"
	} else if (btn1_status = 1) and (btn1_new_status = 0) {
		btn1_status := 0
		if (h_entry = "btn1") {
			send {h up}
			h_entry := "n"
		}
	}
	if (btn2_status = 0) and (btn2_new_status = 1) {
		btn2_status := 1
		if (not j_entry = "n")
			send {j up}
		send {j down}
		j_entry := "btn2"
	} else if (btn2_status = 1) and (btn2_new_status = 0) {
		btn2_status := 0
		if (j_entry = "btn2") {
			send {j up}
			j_entry := "n"
		}
	}
	if (btn3_status = 0) and (btn3_new_status = 1) {
		btn3_status := 1
		if (not k_entry = "n")
			send {k up}
		send {k down}
		k_entry := "btn3"
	} else if (btn3_status = 1) and (btn3_new_status = 0) {
		btn3_status := 0
		if (k_entry = "btn3") {
			send {k up}
			k_entry := "n"
		}
	}
	if (btn4_status = 0) and (btn4_new_status = 1) {
		btn4_status := 1
		if (not u_entry = "n")
			send {u up}
		send {u down}
		u_entry := "btn4"
	} else if (btn4_status = 1) and (btn4_new_status = 0) {
		btn4_status := 0
		if (u_entry = "btn4") {
			send {u up}
			u_entry := "n"
		}
	}
	
	;;;;; pov
	
	if (pov1_status = 0) and (pov1_new_status = 1) {
		pov1_status := 1
		if (csinput = 0) {
			send {a down}
		} else {
			if (not h_entry = "n")
				send {h up}
			send {h down}
			h_entry := "pov1"
		}
	} else if (pov1_status = 1) and (pov1_new_status = 0) {
		pov1_status := 0
		if (csinput = 0) {
			send {a up}
		} else {
			if (h_entry = "pov1") {
				send {h up}
				h_entry := "n"
			}
		}
	}
	if (pov2_status = 0) and (pov2_new_status = 1) {
		pov2_status := 1
		if (csinput = 0) {
			send {s down}
		} else {
			if (not j_entry = "n")
				send {j up}
			send {j down}
			j_entry := "pov2"
		}
	} else if (pov2_status = 1) and (pov2_new_status = 0) {
		pov2_status := 0
		if (csinput = 0) {
			send {s up}
		} else {
			if (j_entry = "pov2") {
				send {j up}
				j_entry := "n"
			}
		}
	}
	if (pov3_status = 0) and (pov3_new_status = 1) {
		pov3_status := 1
		if (csinput = 0) {
			send {d down}
		} else {
			if (not k_entry = "n")
				send {k up}
			send {k down}
			k_entry := "pov3"
		}
	} else if (pov3_status = 1) and (pov3_new_status = 0) {
		pov3_status := 0
		if (csinput = 0) {
			send {d up}
		} else {
			if (k_entry = "pov3") {
				send {k up}
				k_entry := "n"
			}
		}
	}
	if (pov4_status = 0) and (pov4_new_status = 1) {
		pov4_status := 1
		if (csinput = 0) {
			send {w down}
		} else {
			if (not u_entry = "n")
				send {u up}
			send {u down}
			u_entry := "pov4"
		}
	} else if (pov4_status = 1) and (pov4_new_status = 0) {
		pov4_status := 0
		if (csinput = 0) {
			send {w up}
		} else {
			if (u_entry = "pov4") {
				u_entry := "n"
				send {u up}
			}
		}
	}
	
	;;;;; joyl
	
	if (joyll_status = 0) and (joyll_new_status = 1) {
		joyll_status := 1
		if (not u_entry = "n")
			send {u up}
		send {u down}
		u_entry := "joyll"
	} else if (joyll_status = 1) and (joyll_new_status = 0) {
		joyll_status := 0
		if (u_entry = "joyll") {
			send {u up}
			u_entry := "n"
		}
	}
	if (joylr_status = 0) and (joylr_new_status = 1) {
		joylr_status := 1
		if (not k_entry = "n")
			send {k up}
		send {k down}
		k_entry := "joylr"
	} else if (joylr_status = 1) and (joylr_new_status = 0) {
		joylr_status := 0
		if (k_entry = "joylr") {
			send {k up}
			k_entry := "joylr"
		}
	}
	
	;;;;; joyr
	
	if (joyrl_status = 0) and (joyrl_new_status = 1) {
		joyrl_status := 1
		send {e down}
	} else if (joyrl_status = 1) and (joyrl_new_status = 0) {
		joyrl_status := 0
		send {e up}
	}
	if (joyrr_status = 0) and (joyrr_new_status = 1) {
		joyrr_status := 1
		send {y down}
	} else if (joyrr_status = 1) and (joyrr_new_status = 0) {
		joyrr_status := 0
		send {y up}
	}
	
	;;;;; l1
	
	if (l1_status = 0) and (l1_new_status = 1) {
		l1_status := 1
		; h
		if (h_entry = "n")
			send {h down}
		h_entry := "l1"
		; u
		if (u_entry = "n")
			send {u down}
		u_entry := "l1"
	} else if (l1_status = 1) and (l1_new_status = 0) {
		l1_status := 0
		; h
		if (h_entry = "l1") {
			send {h up}
			h_entry := "n"
		}
		; u
		if (u_entry = "l1") {
			send {u up}
			u_entry := "n"
		}
	}
	
	;;;;; r1
	
	if (r1_status = 0) and (r1_new_status = 1) {
		r1_status := 1
		; j
		if (j_entry = "n")
			send {j down}
		j_entry := "r1"
		; k
		if (k_entry = "n")
			send {k down}
		k_entry := "r1"
	} else if (r1_status = 1) and (r1_new_status = 0) {
		r1_status := 0
		; j
		if (j_entry = "r1") {
			send {j up}
			j_entry := "n"
		}
		; k
		if (k_entry = "r1") {
			send {k up}
			k_entry := "n"
		}
	}
	
	;;;;; l2
	
	if (l2_status = 0) and (l2_new_status = 1) {
		l2_status := 1
		; h
		if (h_entry = "n")
			send {h down}
		h_entry := "l2"
		; u
		if  (u_entry = "n")
			send {u down}
		u_entry := "l2"
		; j
		if (j_entry = "n")
			send {j down}
		j_entry := "l2"
		; k
		if (k_entry = "n")
			send {k down}
		k_entry := "l2"
	} else if (l2_status = 1) and (l2_new_status = 0) {
		l2_status := 0
		; h
		if (h_entry = "l2") {
			send {h up}
			h_entry := "n"
		}
		; u
		if (u_entry = "l2") {
			send {u up}
			u_entry := "n"
		}
		; j
		if (j_entry = "l2") {
			send {j up}
			j_entry := "n"
		}
		; k
		if (k_entry = "l2") {
			send {k up}
			k_entry := "n"
		}
	}
	
	;;;;; r2
	
	if (r2_status = 0) and (r2_new_status = 1) {
		r2_status := 1
		; h
		if (h_entry = "n")
			send {h down}
		h_entry := "r2"
		; u
		if  (u_entry = "n")
			send {u down}
		u_entry := "r2"
		; j
		if (j_entry = "n")
			send {j down}
		j_entry := "r2"
		; k
		if (k_entry = "n")
			send {k down}
		k_entry := "r2"
	} else if (r2_status = 1) and (r2_new_status = 0) {
		r2_status := 0
		; h
		if (h_entry = "r2") {
			send {h up}
			h_entry := "n"
		}
		; u
		if (u_entry = "r2") {
			send {u up}
			u_entry := "n"
		}
		; j
		if (j_entry = "r2") {
			send {j up}
			j_entry := "n"
		}
		; k
		if (k_entry = "r2") {
			send {k up}
			k_entry := "n"
		}
	}
	
	;;;;; debug
	
	;tooltip, CS:%csinput%`n`nB3:%btn3_new_status% B2:%btn2_new_status% B1:%btn1_new_status% B4:%btn4_new_status%`nP3:%pov3_new_status% P2:%pov2_new_status% P1:%pov1_new_status% P4:%pov4_new_status%`nLL:%joyll_new_status% LR:%joylr_new_status% RL:%joyrl_new_status% RR:%joyrr_new_status%`nL1:%l1_new_status% R1:%r1_new_status% L2:%l2_new_status% R2:%r2_new_status%`n`nU:%u_entry%`nH:%h_entry%`nJ:%j_entry%`nK:%k_entry%
	
}

cleartooltip:
tooltip
return

HideTrayTip() {
	TrayTip  ; Attempt to hide it the normal way.
	if SubStr(A_OSVersion,1,3) = "10." {
		Menu Tray, NoIcon
		Sleep 200  ; It may be necessary to adjust this sleep.
		Menu Tray, Icon
	}
}
