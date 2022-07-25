//
//  ChatRow.swift
//  FirebaseChatApp
//
//  Created by Tsenguun on 25/7/22.
//

import SwiftUI

struct ChatRow: View {
    
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isMe {
                Spacer()
            }
            
            VStack(alignment: .leading) {
                Text(message.username)
                    .font(.footnote)
                    .foregroundColor(message.isMe ? .white : .gray)
                Text(message.messageText)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(message.isMe ? .white : .black)
                    .lineLimit(nil)
            }
            .padding(10)
            .background(RoundedCorners(color: message.isMe ?  Color(red: 118/255, green: 74/255, blue: 241/255) : .white, tl: message.isMe ? 20 : 0, tr: 20, bl: 20, br: message.isMe ? 0 : 20))
            .frame(maxWidth: 300, alignment: message.isMe ? .trailing : .leading)
            
            if !message.isMe {
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(message: sampleConversation[2])
    }
}

//    .background(message.isMe ?  Color(red: 118/255, green: 74/255, blue: 241/255) : Color.white)

struct RoundedCorners: View {
    var color: Color = .blue
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                
                let w = geometry.size.width
                let h = geometry.size.height
                
                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}

