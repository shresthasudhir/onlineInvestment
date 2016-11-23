package org.coop.sidc.controllers;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.coop.sidc.domain.Authority;
import org.coop.sidc.domain.Credential;
import org.coop.sidc.domain.Member;
import org.coop.sidc.service.CredentialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value="/user")
@SessionAttributes({"activeUser"})
public class CredentialController {
	@Autowired
	CredentialService credentialService;

	@RequestMapping(value="/new",method=RequestMethod.GET)
	public String newUser(@ModelAttribute("newUser") Credential credential){
		return "newUserForm";
	}	

	@RequestMapping(value="/new",method=RequestMethod.POST)
	public String addNewUser(@ModelAttribute("newUser") Credential credential,Model model){
		Credential dbUser=credentialService.findByUsername(credential.getUsername());
		if (dbUser!=null || !credential.getPassword().equals(credential.getConfirm())){
			return "newUserForm";
		}
		Set<Authority> authorities=new HashSet<Authority>();
		Authority auth1=new Authority("ROLE_USER");
		
		auth1.setCredential(credential);
		authorities.add(auth1);
		
		credential.setEnabled(true);
		credential.setRoles(authorities);
		
		credentialService.save(credential);
		return "redirect:/";
	}		
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addUser(@ModelAttribute("newUser") Credential credential){
		return "addUserForm";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String addUser(@ModelAttribute("newUser") Credential credential,BindingResult result,Model model){
		Credential dbUser=credentialService.findByUsername(credential.getUsername());
		if (result.hasErrors() || dbUser!=null){
			return "addUserForm";
		}
		Set<Authority> authorities=new HashSet<Authority>();
		Authority auth1=new Authority(credential.getUserType());		
		auth1.setCredential(credential);
		authorities.add(auth1);
		credential.setRoles(authorities);
		
		credentialService.save(credential);
		model.addAttribute("message","User has been added successfully!");
		return "redirect:/user/add";
	}	

	@RequestMapping(value="/edit/{id}",method=RequestMethod.GET)
	public String editUser(@PathVariable Long id,Model model){
		Credential credential=credentialService.get(id);
		for (Authority authority:credential.getRoles()){
			credential.setUserType(authority.getAuthority());
		}
		model.addAttribute("user",credential);
		return "editUserForm";
	}

	@RequestMapping(value="/edit/{id}",method=RequestMethod.POST)
	public String saveUser(@PathVariable Long id,@ModelAttribute("user") Credential credential){
		Set<Authority> authorities=new HashSet<Authority>();
		Authority auth1=new Authority(credential.getUserType());		
		auth1.setCredential(credential);		
//		credential.setRoles(authorities);
		
		credentialService.save(credential);
		return "redirect:/user/add";
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)
	public String deleteUser(@PathVariable Long id){
		credentialService.delete(id);
		return "redirect:/user/add";
	}	
	
	@ModelAttribute("users")
	public List<Credential> getUserList(){		
		return credentialService.getList();
	}
}
