package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ActionForward;

public class DelProductToCartLAllAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AddCartAction start");
		ProductDAO instance = ProductDAO.getInstance();
		String userid = request.getParameter("userid");
		instance.delProductToCartLAll(userid);
		return null;
	}

}
