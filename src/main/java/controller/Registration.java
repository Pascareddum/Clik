package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.dao.UserDAO;

import java.io.IOException;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/registration")
public class Registration extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        final Pattern info_string = Pattern.compile("^([a-zA-Z\\xE0\\xE8\\xE9\\xF9\\xF2\\xEC\\x27]\\s?){2,20}$");
        final Pattern email_string = Pattern.compile("^[a-zA-Z\\d._%-]+@[a-zA-Z\\d.-]+\\.[a-zA-Z]{2,20}$");
        final Pattern password_string = Pattern.compile("^[a-zA-Z\\d\\-\\xE0\\xE8\\xE9\\xF9\\xF2\\xEC\\x27]{6,16}");

        int level = 0;

        String name = request.getParameter("name");
        Matcher matcher = info_string.matcher(name);
        boolean matchFound = matcher.find();
        if (matchFound)
            level++;

        String surname = request.getParameter("surname");
        matcher = info_string.matcher(surname);
        matchFound = matcher.find();
        if (matchFound)
            level++;

        String email = request.getParameter("email");
        matcher = email_string.matcher(email);
        matchFound = matcher.find();
        if (matchFound)
            level++;

        String password = request.getParameter("password");
        matcher = password_string.matcher(password);
        matchFound = matcher.find();
        if (matchFound)
            level++;

        System.out.println(level);

        UserDAO service = new UserDAO();

        if (!service.isAlreadyRegistered(email) && level == 4) {

            User user = new User();
            user.setName(name);
            user.setSurname(surname);
            user.setEmail(email);
            user.setPassword(password);
            user.setAdmin(false);

            service.doSave(user);

            HttpSession session = request.getSession();
            session.setAttribute("auth", user);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/error.jsp");
            request.setAttribute("type", "success");
            request.setAttribute("msg", "Registrazione effettuata");
            request.setAttribute("redirect", "index.jsp");
            dispatcher.include(request, response);
        }

        else if (level != 4) {

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/error.jsp");
            request.setAttribute("type", "alert");
            request.setAttribute("msg", "Errore registrazione");
            request.setAttribute("redirect", "register.jsp");
            dispatcher.include(request, response);
        }

        else {

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/error.jsp");
            request.setAttribute("type", "alert");
            request.setAttribute("msg", "Email già in uso");
            request.setAttribute("redirect", "login.jsp");
            dispatcher.include(request, response);
        }
    }
}


