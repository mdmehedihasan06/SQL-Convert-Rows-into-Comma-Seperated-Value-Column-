SELECT MR.OrderID,
   STUFF((SELECT '; ' + P.PaymentDate
          FROM DealerPayment P
          WHERE MR.ID = P.OrderID
          FOR XML PATH('')), 1, 1, '') PaymentDate
FROM MaterialRequest MR
GROUP BY MR.ID,MR.OrderID
