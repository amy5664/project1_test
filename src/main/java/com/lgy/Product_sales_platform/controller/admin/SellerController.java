package com.lgy.Product_sales_platform.controller.admin;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.Product_sales_platform.dao.mapper.CategoryDAO;
import com.lgy.Product_sales_platform.dao.mapper.ProductCategoryDAO;
import com.lgy.Product_sales_platform.dao.mapper.ProductDAO;
import com.lgy.Product_sales_platform.dao.mapper.UserDAO;
import com.lgy.Product_sales_platform.dto.ProductCategoryDTO;
import com.lgy.Product_sales_platform.dto.ProductDTO;
import com.lgy.Product_sales_platform.dto.UserDTO;
import com.lgy.Product_sales_platform.service.ProductService;

@Controller
public class SellerController {
	
	@Autowired private ProductDAO productDAO;
	@Autowired private UserDAO userDAO;
	@Autowired private CategoryDAO categoryDAO;
	@Autowired private ProductCategoryDAO productCategoryDAO;
	@Autowired private ProductService productService;
	

	//마이페이지 메인
	@RequestMapping("/seller/mypage")
	public String mypage() {
		return "redirect:/seller/products";
	}
	
	//상품 목록
	@GetMapping("/seller/products")
	public String productList(@RequestParam(value = "created", required = false) Long createdId, Model model) {
		model.addAttribute("products", productDAO.getProductList());
		model.addAttribute("createdId", createdId); // 등록 성공 배너
		model.addAttribute("activeMenu", "product");
		return "seller/products"; // /WEB-INF/views/seller/products.jsp
	}
	
	@GetMapping("/seller/products/new")
	public String productNewForm(Model model) {
		model.addAttribute("product", new ProductDTO());
		model.addAttribute("categories", categoryDAO.selectTreeFlat());
		model.addAttribute("checkedMap", new HashMap<String, Boolean>());
		model.addAttribute("mainCatIdStr", null); 
		model.addAttribute("activeMenu", "product");
		return "seller/product_new"; // /WEB-INF/views/seller/product_new.jsp
	}
	
	//상품 등록 처리 + 카테고리 매핑(Service로 위임)
	@PostMapping("/seller/products")
	public String createProduct(@ModelAttribute ProductDTO dto,
								@RequestParam(value = "catIds", required = false) List<Long> catIds,
								@RequestParam(value = "mainCatId", required = false) Long mainCatId,
								RedirectAttributes ra) {
		 // TODO: 로그인 판매자라면 여기서 dto.setProdSeller(loginSellerId); 같은 보정
		dto.setProdSeller("admin01"); // 임시 판매자 ID
		productService.createProductWithCategories(dto, catIds, mainCatId);
		ra.addFlashAttribute("createdId", dto.getProdId());
		return "redirect:/seller/products/" + dto.getProdId(); //상세로
		// return "redirect:/seller/products";        // 목록으로 보내고 싶으면 이 줄 사용
	}
	
	//상품 상세
	@GetMapping("/seller/products/{prodId}")
		public String productDetail(@PathVariable("prodId") Long prodId, Model model) {
			ProductDTO product = productDAO.getProduct(prodId);
			model.addAttribute("product", product);
			model.addAttribute("activeMenu", "product");
			return "seller/productDetail"; // /WEB-INF/views/seller/productDetail.jsp
		}
	
	//수정 폼 이동(카테고리 트리 + 기존 매핑 반영)
	@GetMapping("/seller/products/{id}/edit")
	public String editForm(@PathVariable("id") Long id, Model model) {
		ProductDTO p = productDAO.getProduct(id);
		if (p == null) {
			return "redirect:/seller/products?error=notfound";
		}
		model.addAttribute("product", p);
		model.addAttribute("categories", categoryDAO.selectTreeFlat());
		
		 List<ProductCategoryDTO> mappings = productCategoryDAO.selectByProdId(id);
		 
		 String mainCatIdStr = null;
		 Map<Long, Boolean> checkedMap = new HashMap<>();
	        Set<Long> checkedCatIds = new HashSet<>();
	        Long mainCatId = null;
	        for (ProductCategoryDTO m : mappings) {
	            checkedCatIds.add(m.getCatId());
	            if ("Y".equals(m.getIsMain())) mainCatId = m.getCatId();
	        }
	        model.addAttribute("checkedMap", checkedMap);
//	        model.addAttribute("mainCatId", mainCatId);
	        model.addAttribute("mainCatIdStr", mainCatIdStr);
	        model.addAttribute("activeMenu", "product");
	        return "seller/product_edit";
	}
	
	//수정 처리 (정보 + 매핑 함께 갱신)
	@PostMapping("/seller/products/{id}/edit")
    public String update(@PathVariable("id") Long id,
                         @ModelAttribute ProductDTO form,
                         @RequestParam(value = "catIds", required = false) List<Long> catIds,
                         @RequestParam(value = "mainCatId", required = false) Long mainCatId,
                         RedirectAttributes ra) {

        form.setProdId(id);
        productService.updateProductWithCategories(form, catIds, mainCatId); // ✅ 트랜잭션 경계
        ra.addFlashAttribute("msg", "수정되었습니다.");
        return "redirect:/seller/products/" + id; // 상세로 이동
	}
	
	//삭제(JSP 폼 한계상 POST 사용함)
	@PostMapping("/seller/products/{id}/delete")
	public String delete(@PathVariable("id") Long id, RedirectAttributes ra) {
		int deleted = productDAO.deleteProduct(id);
		if (deleted == 0) {
			ra.addFlashAttribute("error", "삭제할 수 없습니다.");
		} else {
			ra.addFlashAttribute("msg", "삭제되었습니다.");
		}
		return "redirect:/seller/products";
	}
	
	//회원 목록
	@GetMapping("/seller/members")
	public String memberList(Model model) {
		model.addAttribute("users", userDAO.getUserList());
		model.addAttribute("activeMenu", "member");
		return "seller/members"; // /WEB-INF/views/seller/members.jsp
	}

	//회원 상세
	@GetMapping("/seller/members/{memberId}")
	public String memberDetail(@PathVariable("memberId") String memberId ,Model model) {
		UserDTO user = userDAO.getUser(memberId);
	    model.addAttribute("user", user);
	    model.addAttribute("activeMenu", "member");
		// TODO: 이후 구매내역 orders도 같이 model에 넣을 예정
		return "seller/memberDetail"; // /WEB-INF/views/seller/memberDetail.jsp
	}
}
