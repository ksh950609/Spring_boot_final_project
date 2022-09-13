package com.spring_boot_final.project.service;

import com.spring_boot_final.project.model.ExhbnVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.ArrayList;


@Service
@Slf4j
public class OpenAPIService {

    public void exhbnListRequest(String from, String to, String cPage, String rows) throws IOException, ParserConfigurationException, SAXException {
        String urlName = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm";
        String serviceKey = "XTmkU7f37X2FaI%2BIR%2BWSva%2F2qnhC21txDXcnGRaIed1ekKJC%2Fl2VT1SwfV2Fph9HCGAJfQ1IICQIg3KJF9rD%2Bw%3D%3D";
        //String from = "20220601";
        //String to = "20221231";
        //String cPage = "1";
        //String rows = "200";
        String realmCode = "D000"; //A000 연극 / B000 음악(콘서드, 뮤직컬 등) / C000 무용 / D000 미술 /E000 건축 /G000 영상 / H000 문학 / I000 문화정책 / J000 축제문화공간/ L000 기타

        String urlString = urlName + "?" + URLEncoder.encode("serviceKey", StandardCharsets.UTF_8) + "=" + serviceKey + /*Service Key*/
                "&" + URLEncoder.encode("sortStdr", StandardCharsets.UTF_8) + "=" + URLEncoder.encode("1", StandardCharsets.UTF_8) + /*1:등록일, 2:공연명, 3:지역*/
                "&" + URLEncoder.encode("from", StandardCharsets.UTF_8) + "=" + URLEncoder.encode(from, StandardCharsets.UTF_8) +
                "&" + URLEncoder.encode("to", StandardCharsets.UTF_8) + "=" + URLEncoder.encode(to, StandardCharsets.UTF_8) +
                "&" + URLEncoder.encode("realmCode", StandardCharsets.UTF_8) + "=" + URLEncoder.encode(realmCode, StandardCharsets.UTF_8) +
                "&" + URLEncoder.encode("cPage", StandardCharsets.UTF_8) + "=" + URLEncoder.encode(cPage, StandardCharsets.UTF_8) +
                "&" + URLEncoder.encode("rows", StandardCharsets.UTF_8) + "=" + URLEncoder.encode(rows, StandardCharsets.UTF_8); /*3~100*/

        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        //log.error(sb.toString());
        exhbnListRequest_xmlParsing(sb.toString());
    }


    public void exhbnListRequest_xmlParsing(String response) throws IOException, ParserConfigurationException, SAXException {

        InputSource is = new InputSource(new StringReader(response));

        Document documentInfo = DocumentBuilderFactory
                .newInstance()
                .newDocumentBuilder()
                .parse(is);

        // root tag
        documentInfo.getDocumentElement().normalize();
        System.out.println("Root Element :" + documentInfo.getDocumentElement().getNodeName());

        // 파싱할 tag
        NodeList nList = documentInfo.getElementsByTagName("perforList");
        System.out.println("파싱할 리스트 수 : " + nList.getLength());

        for (int i = 0; i < nList.getLength(); i++) {
            Node nNode = nList.item(i);
            if (nNode.getNodeType() == Node.ELEMENT_NODE) {

                Element eElement = (Element) nNode;

                int seq = Integer.parseInt(eElement.getElementsByTagName("seq").item(0).getTextContent());
                /*
                if (dao.existExhbn(seq) < 1) {

                    System.out.println("번호  : " + eElement.getElementsByTagName("seq").item(0).getTextContent());
                    ExhbnVO vo = exhbnDetailRequest(seq);
                    dao.insertExhbn(vo);
                }
                 */
            }


        }
    }


    public ExhbnVO exhbnDetailRequest(int seq) throws IOException, ParserConfigurationException, SAXException {

        String urlName = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/";
        String serviceKey = "XTmkU7f37X2FaI%2BIR%2BWSva%2F2qnhC21txDXcnGRaIed1ekKJC%2Fl2VT1SwfV2Fph9HCGAJfQ1IICQIg3KJF9rD%2Bw%3D%3D";
        //int seq = 210962;

        String urlString = urlName + "?" + URLEncoder.encode("serviceKey", StandardCharsets.UTF_8) + "=" + serviceKey + /*Service Key*/
                "&" + URLEncoder.encode("seq", StandardCharsets.UTF_8) + "=" + URLEncoder.encode(String.valueOf(seq), StandardCharsets.UTF_8);

        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        //log.error(sb.toString());
        return exhbnDetailRequest_xmlParsing(sb.toString());
    }


    public ExhbnVO exhbnDetailRequest_xmlParsing(String response) throws IOException, ParserConfigurationException, SAXException {

        InputSource is = new InputSource(new StringReader(response));

        ExhbnVO vo = new ExhbnVO();

        Document documentInfo = DocumentBuilderFactory
                .newInstance()
                .newDocumentBuilder()
                .parse(is);//.parse(url);

        // root tag
        documentInfo.getDocumentElement().normalize();
        System.out.println("Root Element :" + documentInfo.getDocumentElement().getNodeName());

        // 파싱할 tag
        NodeList nList = documentInfo.getElementsByTagName("perforInfo");
        System.out.println("파싱할 리스트 수 : " + nList.getLength());

        for (int i = 0; i < nList.getLength(); i++) {
            Node nNode = nList.item(i);
            if (nNode.getNodeType() == Node.ELEMENT_NODE) {

                Element eElement = (Element) nNode;

                int seq = Integer.parseInt(eElement.getElementsByTagName("seq").item(0).getTextContent());
                String title = eElement.getElementsByTagName("title").item(0).getTextContent();


                String date = eElement.getElementsByTagName("startDate").item(0).getTextContent();
                Date startDate = Date.valueOf(date.substring(0, 4) + "-" + date.substring(4, 6) + "-" + date.substring(6, 8));

                date = eElement.getElementsByTagName("endDate").item(0).getTextContent();
                Date endDate = Date.valueOf(date.substring(0, 4) + "-" + date.substring(4, 6) + "-" + date.substring(6, 8));


                String place = eElement.getElementsByTagName("place").item(0).getTextContent();
                String realName = eElement.getElementsByTagName("realmName").item(0).getTextContent();
                String area = eElement.getElementsByTagName("area").item(0).getTextContent();
                String price = eElement.getElementsByTagName("price").item(0).getTextContent();
                String contents1 = eElement.getElementsByTagName("contents1").item(0).getTextContent();
                String contents2 = eElement.getElementsByTagName("contents2").item(0).getTextContent();
                String url = eElement.getElementsByTagName("url").item(0).getTextContent();
                String phone = eElement.getElementsByTagName("phone").item(0).getTextContent();
                String imgUrl = eElement.getElementsByTagName("imgUrl").item(0).getTextContent();

                double gpsX;
                double gpsY;
                try {
                    gpsX = Double.parseDouble(eElement.getElementsByTagName("gpsX").item(0).getTextContent());
                    gpsY = Double.parseDouble(eElement.getElementsByTagName("gpsY").item(0).getTextContent());
                } catch (NumberFormatException e) {
                    gpsX = 0;
                    gpsY = 0;
                }

                String placeUrl = eElement.getElementsByTagName("placeUrl").item(0).getTextContent();
                String placeAddr = eElement.getElementsByTagName("placeAddr").item(0).getTextContent();
                String placeSeq = eElement.getElementsByTagName("placeSeq").item(0).getTextContent();

                System.out.println("######################");
                System.out.println("번호  : " + seq);
                System.out.println("제목  : " + title);
                System.out.println("시작일  : " + startDate);
                System.out.println("종료일  : " + endDate);
                System.out.println("장소  : " + place);
                System.out.println("분류  : " + realName);
                System.out.println("지역  : " + area);
                System.out.println("가격  : " + price);
                System.out.println("contents1  : " + contents1);
                System.out.println("contents2  : " + contents2);
                System.out.println("홈페이지  : " + url);
                System.out.println("번호  : " + phone);
                System.out.println("이미지  : " + imgUrl);
                System.out.println("gpsX  : " + gpsX);
                System.out.println("gpsY  : " + gpsY);
                System.out.println("상세페이지주소  : " + placeUrl);
                System.out.println("자세한주소  : " + placeAddr);
                System.out.println("장소번호  : " + placeSeq);

                vo.setExhbnId(seq);
                vo.setExhbnTitle(title);
                vo.setExhbnStartDate(startDate);
                vo.setExhbnEndDate(endDate);
                vo.setExhbnPlace(place);
                vo.setExhbnArea(area);
                vo.setExhbnPrice(price);
                vo.setExhbnUrl(url);
                vo.setExhbnPhone(phone);
                vo.setExhbnImgUrl(imgUrl);
                vo.setGpsX(gpsX);
                vo.setGpsY(gpsY);
                vo.setExhbnPlaceUrl(placeUrl);
                vo.setExhbnPlaceAddr(placeAddr);

            }
        }

        return vo;

    }


}
