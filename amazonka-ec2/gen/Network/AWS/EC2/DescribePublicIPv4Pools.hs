{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.DescribePublicIPv4Pools
-- Copyright   : (c) 2013-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Describes the specified IPv4 address pools.
--
--
module Network.AWS.EC2.DescribePublicIPv4Pools
    (
    -- * Creating a Request
      describePublicIPv4Pools
    , DescribePublicIPv4Pools
    -- * Request Lenses
    , dpipPoolIds
    , dpipNextToken
    , dpipMaxResults

    -- * Destructuring the Response
    , describePublicIPv4PoolsResponse
    , DescribePublicIPv4PoolsResponse
    -- * Response Lenses
    , dpiprsPublicIPv4Pools
    , dpiprsNextToken
    , dpiprsResponseStatus
    ) where

import Network.AWS.EC2.Types
import Network.AWS.EC2.Types.Product
import Network.AWS.Lens
import Network.AWS.Prelude
import Network.AWS.Request
import Network.AWS.Response

-- | /See:/ 'describePublicIPv4Pools' smart constructor.
data DescribePublicIPv4Pools = DescribePublicIPv4Pools'
  { _dpipPoolIds    :: !(Maybe [Text])
  , _dpipNextToken  :: !(Maybe Text)
  , _dpipMaxResults :: !(Maybe Nat)
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'DescribePublicIPv4Pools' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dpipPoolIds' - The IDs of the address pools.
--
-- * 'dpipNextToken' - The token for the next page of results.
--
-- * 'dpipMaxResults' - The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned @nextToken@ value.
describePublicIPv4Pools
    :: DescribePublicIPv4Pools
describePublicIPv4Pools =
  DescribePublicIPv4Pools'
    { _dpipPoolIds = Nothing
    , _dpipNextToken = Nothing
    , _dpipMaxResults = Nothing
    }


-- | The IDs of the address pools.
dpipPoolIds :: Lens' DescribePublicIPv4Pools [Text]
dpipPoolIds = lens _dpipPoolIds (\ s a -> s{_dpipPoolIds = a}) . _Default . _Coerce

-- | The token for the next page of results.
dpipNextToken :: Lens' DescribePublicIPv4Pools (Maybe Text)
dpipNextToken = lens _dpipNextToken (\ s a -> s{_dpipNextToken = a})

-- | The maximum number of results to return with a single call. To retrieve the remaining results, make another call with the returned @nextToken@ value.
dpipMaxResults :: Lens' DescribePublicIPv4Pools (Maybe Natural)
dpipMaxResults = lens _dpipMaxResults (\ s a -> s{_dpipMaxResults = a}) . mapping _Nat

instance AWSRequest DescribePublicIPv4Pools where
        type Rs DescribePublicIPv4Pools =
             DescribePublicIPv4PoolsResponse
        request = postQuery ec2
        response
          = receiveXML
              (\ s h x ->
                 DescribePublicIPv4PoolsResponse' <$>
                   (x .@? "publicIpv4PoolSet" .!@ mempty >>=
                      may (parseXMLList "item"))
                     <*> (x .@? "nextToken")
                     <*> (pure (fromEnum s)))

instance Hashable DescribePublicIPv4Pools where

instance NFData DescribePublicIPv4Pools where

instance ToHeaders DescribePublicIPv4Pools where
        toHeaders = const mempty

instance ToPath DescribePublicIPv4Pools where
        toPath = const "/"

instance ToQuery DescribePublicIPv4Pools where
        toQuery DescribePublicIPv4Pools'{..}
          = mconcat
              ["Action" =:
                 ("DescribePublicIpv4Pools" :: ByteString),
               "Version" =: ("2016-11-15" :: ByteString),
               toQuery (toQueryList "PoolId" <$> _dpipPoolIds),
               "NextToken" =: _dpipNextToken,
               "MaxResults" =: _dpipMaxResults]

-- | /See:/ 'describePublicIPv4PoolsResponse' smart constructor.
data DescribePublicIPv4PoolsResponse = DescribePublicIPv4PoolsResponse'
  { _dpiprsPublicIPv4Pools :: !(Maybe [PublicIPv4Pool])
  , _dpiprsNextToken       :: !(Maybe Text)
  , _dpiprsResponseStatus  :: !Int
  } deriving (Eq, Read, Show, Data, Typeable, Generic)


-- | Creates a value of 'DescribePublicIPv4PoolsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dpiprsPublicIPv4Pools' - Information about the address pools.
--
-- * 'dpiprsNextToken' - The token to use to retrieve the next page of results. This value is @null@ when there are no more results to return.
--
-- * 'dpiprsResponseStatus' - -- | The response status code.
describePublicIPv4PoolsResponse
    :: Int -- ^ 'dpiprsResponseStatus'
    -> DescribePublicIPv4PoolsResponse
describePublicIPv4PoolsResponse pResponseStatus_ =
  DescribePublicIPv4PoolsResponse'
    { _dpiprsPublicIPv4Pools = Nothing
    , _dpiprsNextToken = Nothing
    , _dpiprsResponseStatus = pResponseStatus_
    }


-- | Information about the address pools.
dpiprsPublicIPv4Pools :: Lens' DescribePublicIPv4PoolsResponse [PublicIPv4Pool]
dpiprsPublicIPv4Pools = lens _dpiprsPublicIPv4Pools (\ s a -> s{_dpiprsPublicIPv4Pools = a}) . _Default . _Coerce

-- | The token to use to retrieve the next page of results. This value is @null@ when there are no more results to return.
dpiprsNextToken :: Lens' DescribePublicIPv4PoolsResponse (Maybe Text)
dpiprsNextToken = lens _dpiprsNextToken (\ s a -> s{_dpiprsNextToken = a})

-- | -- | The response status code.
dpiprsResponseStatus :: Lens' DescribePublicIPv4PoolsResponse Int
dpiprsResponseStatus = lens _dpiprsResponseStatus (\ s a -> s{_dpiprsResponseStatus = a})

instance NFData DescribePublicIPv4PoolsResponse where
