package com.jw.shop.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jw.shop.domain.BuyVO;
import com.jw.shop.domain.ProductVO;
import com.jw.shop.domain.UserVO;
import com.jw.shop.mapper.BuyMapper;
import com.jw.shop.mapper.ProductMapper;
import com.jw.shop.mapper.UserMapper;
import com.jw.shop.service.AdmService;
import com.jw.shop.util.Paging;
import com.jw.shop.util.Upload;

@Service
@RequestMapping("/adm")
public class AdmServiceImpl implements AdmService {

	private final ProductMapper productMapper;
	private final UserMapper userMapper;
	private final Upload upload;
	private final BuyMapper buyMapper;
	
	public AdmServiceImpl(ProductMapper productMapper, UserMapper userMapper, Upload upload, BuyMapper buyMapper) {
		this.productMapper = productMapper;
		this.userMapper = userMapper;
		this.upload = upload;
		this.buyMapper = buyMapper;
	}
	
	@Override
	public String admIndex(HttpSession session, HttpServletResponse response, BuyVO vo, Model model, @RequestParam(defaultValue="1") int curPage) throws IOException {
		// TODO 차트 생성해야함
		UserVO userInfo = (UserVO) session.getAttribute("shopMember");
		if(userInfo == null) {
			return "/index";
		} else if(userInfo.getShop_id().equals("admin")){
			// 판매현황 모아보기
			int man = 0;
			int woman = 0;
			int children = 0;
			int un = 0;
			List<Map<String, Object>> list = buyMapper.buySelect(vo);
			for(int i = 0; i<list.size(); i++) {
				String buy_cate = (String) list.get(i).get("BUY_CATE");
				if(buy_cate != null) {
					if(buy_cate.equals("남자 의류")) {
						man++;
					} else if(buy_cate.equals("여자 의류")) {
						woman++;
					} else {
						children++;
					}
				} else {
					un++;
				}
			}
			int listCnt = buyMapper.intBuySelect(vo);
			Paging paging = new Paging(listCnt, curPage, 8);
	        vo.setStartIndex(paging.getStartIndex());
	        vo.setCntPerPage(paging.getPageSize());
			model.addAttribute("man", man);
			model.addAttribute("woman", woman);
			model.addAttribute("children", children);
			model.addAttribute("un", un);
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			return "/adm/index";
		} else {
			return null;
		}
	}

	@Override
	public String admUserList(UserVO vo, Model model) {
		List<Map<String, Object>> list = userMapper.userSelect(vo);
		model.addAttribute("userList", list);
		return "/adm/user/user_list";
	}

	@Override
	public String admUserUpdate() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String admProductForm() {
		// TODO Auto-generated method stub
		return "/adm/product/form";
	}

	@Override
	public String admProductInsert(ProductVO vo, Model model, MultipartHttpServletRequest file) throws IOException {
//		System.out.println("file.getName");
//		System.out.println(file.getName());
//		System.out.println("file.getSize");
//		System.out.println(file.getSize());
//		System.out.println("file.getOriginalFilename");
//		System.out.println(file.getOriginalFilename());
//		System.out.println("file.getBytes");
//		byte[] data = file.getBytes();
//		System.out.println(data);
//		System.out.println("file.getClass");
//		System.out.println(file.getClass());
//		System.out.println("file.getContentType");
//		System.out.println(file.getContentType());
//		System.out.println("file.getInputStream");
//		System.out.println(file.getInputStream());
//		System.out.println("file.getResource");
//		System.out.println(file.getResource());
		upload.saveFile(vo, file, model);
		System.out.println(vo.toString());
		productMapper.prdInsert(vo);
//		System.out.println(vo.toString());
		return "redirect:/adm/product/list.do";
	}
	@Override
	public String admProductList(ProductVO vo, Model model) {
		List<Map<String, Object>> result = productMapper.prdSelect(vo);
		model.addAttribute("admProductList", result);
		return "/adm/product/list";
	}
	@Override
	public String admPrdFormUpdate(@RequestParam String prdNum, ProductVO vo, Model model) throws IOException {
//		vo.setPrdNum(prdNum);
		ProductVO productUpdate = productMapper.prdUpdate(vo);
//		System.out.println(productUpdate);
		model.addAttribute("productUpdate", productUpdate);
		return "/adm/product/form_update";
	}

	@Override
	public String admProductSelect(ProductVO vo, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public String admPrdFormUpdateProc(@RequestParam String notImg, ProductVO vo, Model model, MultipartHttpServletRequest file) throws IOException {
//		upload.saveFile(vo, file, model);
//		if(vo.getPrdImg() == null) {
//			vo.setPrdImg(notImg);
//		} else if(vo.getPrdImg2() == null) {
//			vo.setPrdImg2(notImg);
//		} else if(vo.getPrdImg3() == null) {
//			vo.setPrdImg3(notImg);
//		}
//		productMapper.prdUpdateProc(vo);
////		System.out.println(vo.toString());
//		return "redirect:/adm/product/list.do";
//	}
	
	@Override
	public String admPrdFormUpdateProc(ProductVO vo, Model model, MultipartHttpServletRequest file) throws IOException {
		ProductVO item = productMapper.prdView(vo);
		upload.saveFile(vo, file, model);
		System.out.println(vo.toString());
		if(vo.getPrdImg() == null || vo.getPrdImg() == "") {
			System.out.println("1");
			vo.setPrdImg(item.getPrdImg());
		}
		if(vo.getPrdImg2() == null || vo.getPrdImg2() == "") {
			System.out.println("2");
			vo.setPrdImg2(item.getPrdImg2());
		}
		if(vo.getPrdImg3() == null || vo.getPrdImg3() == "") {
			System.out.println("3");
			vo.setPrdImg3(item.getPrdImg3());
		}
		productMapper.prdUpdateProc(vo);
		System.out.println(vo.toString());
//		System.out.println(vo.toString());
		return "redirect:/adm/product/list.do";
	}

	@Override
	public String admProductDelete(ProductVO vo) {
		productMapper.prdDelete(vo);
		return "redirect:/adm/product/list.do";
	}


}
