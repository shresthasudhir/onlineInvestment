package org.coop.sidc.controllers;


import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.coop.sidc.domain.Credential;
import org.coop.sidc.domain.Member;
import org.coop.sidc.service.CredentialService;
import org.coop.sidc.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes({"activeUser"})
public class MainController {
	@Autowired
	CredentialService credentialService;
	
	@RequestMapping(value={"/home"},method=RequestMethod.GET)
	public String welcomePage(HttpServletRequest request,Model model){
		Principal principal = request.getUserPrincipal();
		if(principal!=null){
			Credential credential=credentialService.findByUsername(principal.getName());
			if (credential!=null) model.addAttribute("activeUser",credential);
			if (request.isUserInRole("ROLE_USER")){				
				Member member=credential.getMember();
				if (member!=null){
					model.addAttribute("activeMember",member);
				}
				if (member==null){
					return "redirect:/membership/form";
				} else if (member.getStatus()==2){					
					return "redirect:/membership/agreement/"+String.valueOf(member.getId());
				} else if (member.getStatus()==3){
					return "redirect:/membership/document/"+String.valueOf(member.getId());
				} else if (member.getStatus()==4){
					return "redirect:/membership/payment/"+String.valueOf(member.getId());
				}
			}			
		}
		return "home";
	}	

	@RequestMapping(method=RequestMethod.GET)
	public String pageNotFound(){
		return "forward:/";
	}
}
