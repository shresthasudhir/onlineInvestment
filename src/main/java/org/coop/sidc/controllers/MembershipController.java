package org.coop.sidc.controllers;

import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.coop.sidc.domain.Credential;
import org.coop.sidc.domain.Member;
import org.coop.sidc.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/membership")
@SessionAttributes({"activeUser"})
public class MembershipController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/form",method=RequestMethod.GET)
	public String getMembershipForm(@ModelAttribute("newApplicant") Member member,Model model){		
		return "membershipForm";
	}
	
	@RequestMapping(value="/form",method=RequestMethod.POST)
	public String saveMembershipForm(@ModelAttribute("newApplicant") @Validated Member member,BindingResult result,
			@RequestParam CommonsMultipartFile[] userImage,RedirectAttributes attributes,Model model,Map map){
		
		if (result.hasErrors()){
			return "membershipForm";
		}

		if (userImage != null && userImage.length > 0) {
			for (CommonsMultipartFile file : userImage) {
				System.out.println("File Name: " + file.getOriginalFilename());
				System.out.println("File Data: " + Arrays.toString(file.getBytes()));
			}
		}		
		String myBase64 = new String(Base64.encodeBase64(member.getUserImage()));
		model.addAttribute("imageBase64", myBase64);
		
		
		Credential credential=(Credential) map.get("activeUser");		
		member.setCredential(credential);
		member.setStatus(2L);
		memberService.save(member);
		return "redirect:/membership/agreement/"+String.valueOf(member.getId());
	}
	
	@RequestMapping(value="/agreement/{memberId}",method=RequestMethod.GET)
	public String getAgreementForm(@PathVariable("memberId") Long memberId,Model model){
		Member member=memberService.get(memberId);
		model.addAttribute("activeMember",member);
		return "agreementForm";
	}
	

	@RequestMapping(value="/agreement/{memberId}",method=RequestMethod.POST)
	public String saveAgreementForm(@PathVariable("memberId") Long memberId,Model model){
		Member member=memberService.get(memberId);
		model.addAttribute("activeMember",member);
		if (member==null){
			System.out.println("active member is null");
		}
		member.setStatus(3L);
		member.setAgreement("signed");
		memberService.save(member);
		return "redirect:/membership/document/"+String.valueOf(member.getId());
	}
	
	@RequestMapping(value="/document/{memberId}",method=RequestMethod.GET)
	public String getDocumentForm(@PathVariable("memberId") Long memberId,Model model){
		Member member=memberService.get(memberId);
		model.addAttribute("activeMember",member);
		return "documentForm";
	}

	@RequestMapping(value="/document",method=RequestMethod.POST)
	public String saveDocumentForm(Map map){
		Member member=(Member) map.get("activeMember");
		member.setStatus(4L);
		member.setAgreement("signed");
		memberService.save(member);		
		return "redirect:/membership/payment/"+String.valueOf(member.getId());
	}
	@RequestMapping(value="/payment/{memberId}",method=RequestMethod.GET)
	public String getPaymentForm(@PathVariable("memberId") Long memberId,Model model){			
		Member member=memberService.get(memberId);
		model.addAttribute("activeMember",member);
		return "paymentForm";
	}

	@RequestMapping(value="/payment",method=RequestMethod.POST)
	public String savePaymentForm(Map map){
		Member member=(Member) map.get("activeMember");
		member.setStatus(0L);
		memberService.save(member);				
		return "redirect:/home";
	}
	
	@InitBinder
	public void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) {
		// Convert multipart object to byte[]
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
	}	

}
