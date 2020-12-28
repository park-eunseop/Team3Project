package com.kosmo.veve.board.gallary;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.veve.model.GallaryLikeDTO;
import com.kosmo.veve.model.service.GallaryLikeService;

@SessionAttributes({"userID"})
@Controller
@RequestMapping("/Gallary/Like/")
public class GallaryLikeController {
	
	@Resource(name="likeService")
	private GallaryLikeService likeService;
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
    public String read(@RequestParam("gallary_no") String gallary_no, 
    				 Model model,
    				 @RequestParam Map map,
                     HttpServletRequest httpRequest,
                     GallaryLikeDTO dto
    		) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		
		String name="";
		if(principal != null) {
			name= auth.getName();
		}
		
		map.put("gallary_no", gallary_no);
		map.put("userID", auth.getName());
		
		List<GallaryLikeDTO> like = likeService.selectLikeList(map);
		
		System.out.println(like);
		
		dto.setUserID(name);
		dto.setGallary_no(gallary_no);

        model.addAttribute("heart",like);
		return "gallary/View";
    }

	@ResponseBody
    @RequestMapping(value = "/heart", method = RequestMethod.POST, produces = "application/json")
    public int heart(HttpServletRequest httpRequest,@RequestParam Map map) throws Exception {

        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
        int gallary_no = Integer.parseInt(httpRequest.getParameter("gallary_no"));
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        
        map.put("gallary_no", gallary_no);
		map.put("userID", auth.getName());

        System.out.println(heart);

        if(heart >= 1) {
            likeService.deleteLike(map);
            heart=0;
        } else {
        	likeService.insertLike(map);
            heart=1;
        }

        return heart;
    }

}
